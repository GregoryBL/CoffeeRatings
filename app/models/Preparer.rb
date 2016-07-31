require_relative '../../db/config' 

class Preparer < ActiveRecord::Base
  has_many :reviews
end