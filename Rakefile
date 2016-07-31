require 'rake'
require 'rspec/core/rake_task'

require_relative 'config/application'

desc "create the database"
task "db:create" do
  puts "Creating file #{DB_PATH} if it doesn't exist."
  touch DB_PATH
end

desc "drop the database"
task "db:migrate" do
  puts "Deleting #{DB_PATH}."
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

namespace :generate do
  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specify migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write("class #{name} < ActiveRecord::Migration \n  def change \n  end \nend")
    end
  end

  task :model do
    desc "Create an empty model in app/models, e.g., rake generate:model NAME=ModelName"
    unless ENV.has_key?('NAME')
      raise "Must specify model name, e.g., rake generate:migration NAME=ModelName"
    end

    filename = "%s.rb" % [ENV['NAME']]
    path = APP_ROOT.join('app', 'models', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write("require_relative '../../db/config' \n\nclass #{ENV['NAME']} < ActiveRecord::Base \nend")
    end
  end
end

desc "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/application"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)

task :default  => :specs
