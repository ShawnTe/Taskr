class Detail < ApplicationRecord
  belongs_to :todo, polymorphic: true
  belongs_to :task
  # has_one_attached :image

  validates :todo_type, presence: true


end
