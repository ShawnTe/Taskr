class Detail < ApplicationRecord
  belongs_to :todo, polymorphic: true
  belongs_to :task
  # has_one_attached :image

end
