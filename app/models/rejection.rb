class Rejection < ApplicationRecord
  has_many_attached :uploads
  has_many :categories
  belongs_to :job
end
