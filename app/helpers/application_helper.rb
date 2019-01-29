module ApplicationHelper
  def my_link_to(url)
    url.gsub(/https?:\/\/w{0,3}\./, "")
  end

  def limited_url(url)
    /(.*)(?=\/)/.match(url)
  end

  def completion_tasks(task)
    # create entry in task_history table
    task_history = TaskHistory.new({
      :task_id => task.id,
      :last_due_date => task.date_completed
    })
    if task_history.save
      # change next_due_date
      p "*******************************"
      p "task histoy entry successfully created"
      p "*******************************"
      next_due_date = task.date_completed + frequency(task).day

      task.update_attributes(
        :next_due_date => next_due_date,
        :date_completed => nil
        )
    else
      p "*******************************"
      p "task history entry NOT created"
      p "*******************************"

    end
  end


  def frequency(task)
    frequency_number = task.frequency_number
    frequency_unit = task.frequency_unit
    num_of_days = 0

    case frequency_unit
    when "days"
      then num_of_days = frequency_number
    when "weeks"
      then num_of_days = frequency_number * 7
    when "months"
      then num_of_days = (frequency_number * 30.5).floor
    when "years"
      then num_of_days = (frequency_number * 365)
    end
    num_of_days
  end
end
