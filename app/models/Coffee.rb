require_relative '../../config/application' 

class Coffee < ActiveRecord::Base
  belongs_to :roaster
  has_many :reviews
end