class Detail < ApplicationRecord
  belongs_to :todo, polymorphic: true
  belongs_to :task
end
