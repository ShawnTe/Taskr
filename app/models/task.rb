class Task < ApplicationRecord
  belongs_to :user
  has_many :details

  validates :title, :first_due_date, presence: true

  def self.incomplete
    Task.where.not(date_completed: [nil, ""])
  end
end
