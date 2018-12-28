class SupplyDetail < ApplicationRecord
  has_many :details, as: :todo
  has_many_attached :images
end
