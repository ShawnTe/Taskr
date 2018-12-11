class Contact < ApplicationRecord
  has_many :details, as: :todo
end
