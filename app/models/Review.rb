require_relative '../../config/application'

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :coffee
  belongs_to :preparation
  belongs_to :preparer

  validates :rating, { numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 } }
end