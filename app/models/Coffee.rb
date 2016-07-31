require_relative '../../db/config' 

class Coffee < ActiveRecord::Base
  belongs_to :roaster
  has_many :reviews
end