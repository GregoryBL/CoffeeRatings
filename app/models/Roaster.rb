require_relative '../../db/config' 

class Roaster < ActiveRecord::Base
  has_many :coffees
end