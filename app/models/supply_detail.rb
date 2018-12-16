class SupplyDetail < ApplicationRecord
  has_many :details, as: :todo
end
