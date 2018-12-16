class ContactDetail < ApplicationRecord
  has_many :details, as: :todo
end
