require_relative '../../config/application'

class Roaster < ActiveRecord::Base
  has_many :coffees
end