class Snack < ApplicationRecord

  validates_presence_of :name, :price
  validates_numericality_of :price
end
