class User < ApplicationRecord
  include Clearance::User

  validates :username, presence: true

  has_many :tasks, dependent: :destroy
end
