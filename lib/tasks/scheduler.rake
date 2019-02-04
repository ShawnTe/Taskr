
def due_today(task)
  today = Date.today
  today == task.next_due_date
end

def need_past_due_reminder(task)
  today = Date.today

  (task.next_due_date - today).to_i < 0 && (today - task.next_due_date).to_i % 7 == 0
end

def build_messages(qualified_tasks)
  messages = {}

  qualified_tasks.each do |user_id, tasks = []|
    text_number = User.find(user_id).text_number

    tasks.each do |task|
      message = "Fr: remember2due -\n\n"
      host = "http://www.remember2due.com/"
      last_done = ""

      if task.task_histories.any?
        last_done = "Last done in:\n#{task.task_histories.last.last_due_date.strftime("%B %Y")}\n\n"
      end

      if tasks.count > 1
        message += "You have more than one task due or past due. Check 'em out:\n"
          + host
      else
        message += "Time to #{task.title}.\n\n" + last_done + host + "tasks/#{task.id}"
      end
      messages[text_number] = message
    end
  end
  p messages
end

def add_to_qualified_tasks(qualified_tasks = {}, task)
  qualified_tasks[task.user_id] = [] if !qualified_tasks.has_key?(task.user_id)

  qualified_tasks[task.user_id].push(task)
end

def check_due_dates(tasks)
  qualified_tasks = {}

  tasks.each do |task|
    if due_today(task) || need_past_due_reminder(task)
      add_to_qualified_tasks(qualified_tasks, task)
    end
  end
  qualified_tasks
end

def dispatch(messages)
  if messages.any?
    messages.map do |text_number, message|
      TwilioTextMessenger.new(message).send_message(text_number)
    end
  end
end

namespace :message_tasks do
  desc "Send text messages for due and past due tasks"
  task :send_text_to_users => :environment do
    qualified_tasks = check_due_dates(Task.incomplete)
    messages = build_messages(qualified_tasks)
    dispatch(messages)
  end
end