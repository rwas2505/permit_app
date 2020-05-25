class Category < ApplicationRecord
  belongs_to :rejection
  has_many :subcategories
end
