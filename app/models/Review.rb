require_relative '../../db/config' 

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffee
  belongs_to :preparation
  belongs_to :preparer
end