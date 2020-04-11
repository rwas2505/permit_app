class Case < ApplicationRecord
  belongs_to :installation
  belongs_to :user
  has_many :rejections
end
