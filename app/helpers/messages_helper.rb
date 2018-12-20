module MessagesHelper
  require 'date'


  def build_message(task)
    @task = task

    message = "Time to #{task.title}.\n"
    message += "Last time done was:\n#{task.last_date_done.strftime("%B %Y")}\n"
    message += "Goto task: http://17b3de65.ngrok.io/tasks/3\n"
    message
# Add list of details
  end

  def check_due_date(task)
    today = Date.today

    if today >= task.first_due_date - 14
      p "Fake text sent. *****************"
      # TwilioTextMessenger.new(build_message(@task)).send_message
    else
      p "first_due_date is greater than two weeks away. No text sent."
    end
  end
end
