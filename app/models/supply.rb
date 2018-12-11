class Supply < ApplicationRecord
  has_many :details, as: :todo
end
