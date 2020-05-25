class Rejection < ApplicationRecord
  has_many_attached :uploads
  belongs_to :job
end
