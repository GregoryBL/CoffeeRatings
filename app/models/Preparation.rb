require_relative '../../config/application'

class Preparation < ActiveRecord::Base
  has_many :reviews
end