class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true
  validates :text_number, presence: true

  has_many :tasks, dependent: :destroy
end
