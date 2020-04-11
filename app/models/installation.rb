class Installation < ApplicationRecord
  has_many :cases
  has_many :rejections
end
