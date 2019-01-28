module MessagesHelper
  require 'date'

  def build_message(task)
    host = "https://powerful-sands-71729.herokuapp.com/"
    task_url = host + "tasks/#{task.id}"
    p "Task url in build_messages: " + task_url
    message = "Time to #{task.title}.\n\n"
    if task.task_histories.any?
      message += "Last time done was:\n#{task.task_histories.last.strftime("%B %Y")}\n\n"
    end
    message += "Goto todos: " + task_url
    message
  end

  def check_due_date(task, user)
    today = Date.today

    if today >= task.next_due_date - 14
      message = build_message(task)
      p "Status: Fake text sent. *****************"
      TwilioTextMessenger.new(message).send_message(user)
    else
      p "Status: next_due_date is greater than two weeks away. No text sent."
    end
  end
end
