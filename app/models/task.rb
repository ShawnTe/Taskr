class Task < ApplicationRecord
  belongs_to :user
  has_many :details, dependent: :destroy
  has_many :task_histories, dependent: :destroy

  validates :title, :next_due_date, presence: true

  def self.incomplete
    Task.where(date_completed: [nil, ""])
  end
end
