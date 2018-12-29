class Frequency < ApplicationRecord
  belongs_to :task

  def time_unit
    "#{unit}"
  end
end