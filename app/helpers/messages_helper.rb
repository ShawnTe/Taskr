module MessagesHelper
  require 'date'

  def build_message(task)
    host = "https://remember-2-due.herokuapp.com/"
    task_url = host + "tasks/#{task.id}"
    p "Task url in build_messages: " + task_url
    message = "Time to #{task.title}.\n\n"
    if task.task_histories.any?
      message += "Last time done was:\n#{task.task_histories.last.last_due_date.strftime("%B %Y")}\n\n"
    end
    message += "Goto todos: " + task_url
    message
  end

  def check_due_date(task, user)
    today = Date.today

    if today >= task.next_due_date - 14
      message = build_message(task)
      p "Status: Sending text. *****************"
      TwilioTextMessenger.new(message).send_message(user)
    else
      p "Status: next_due_date is greater than two weeks away. No text sent."
    end
  end
end
