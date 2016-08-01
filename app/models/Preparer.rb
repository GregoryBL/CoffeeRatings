require_relative '../../config/application'

class Preparer < ActiveRecord::Base
  has_many :reviews
end