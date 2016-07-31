require_relative '../../db/config' 

class Preparation < ActiveRecord::Base
  has_many :reviews
end