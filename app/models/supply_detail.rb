class SupplyDetail < ApplicationRecord
  has_many :details, as: :todo
  has_one_attached :image
end
