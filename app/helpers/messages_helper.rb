module MessagesHelper
  require 'date'


  def build_message(task)
    host = "http://5f843c0b.ngrok.io/"
    task_url = host + "/tasks/#{task.id}"
    p task_url
    message = "Time to #{task.title}.\n\n"
    if task.last_date_done
      message += "Last time done was:\n#{task.last_date_done.strftime("%B %Y")}\n\n"
    end
    message += "Goto todos: " + task_url
    message
# Add list of details
  end

  def check_due_date(task)
    today = Date.today

    if today >= task.first_due_date - 14
      p "Fake text sent. *****************"
      message = build_message(task)
      # TwilioTextMessenger.new(message).send_message
    else
      p "first_due_date is greater than two weeks away. No text sent."
    end
  end
end