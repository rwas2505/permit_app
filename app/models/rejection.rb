class Rejection < ApplicationRecord
  belongs_to :installation
  belongs_to :case
end
