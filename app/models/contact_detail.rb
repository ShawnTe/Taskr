class ContactDetail < ApplicationRecord
  has_many :details, as: :todo, dependent: :destroy
end
