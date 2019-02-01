desc "Send text messages for qualified tasks"
task :send_text_messages => :environment do
  puts "Checking for due tasks..."
  qualified_tasks = check_due_dates
  puts "done."
  puts "****"
  puts "Building messages..."
  messages_to_send = build_messages(qualified_tasks)
  puts "done."
  puts "****"
  puts "Dispatching messages..."
  dispatch(messages_to_send)
  puts "done."
  puts "****"
end

def check_due_dates
    today = Date.today
    qualified_tasks = {}

    # gather candidates
    # start with smaller pool
    tasks = Task.incomplete
    ### what if none?

    # iterate thru candidates
    tasks.each do |task|
      if (today - task.next_due_date) < 0
        puts "Not yet due"
      elsif (task.next_due_date - today) <= 0
        # due today, add to hash
        if !qualified_tasks.key?(task.user_id)
          qualified_tasks[task.user_id] = [task]
        else
          qualified_tasks[task.user_id].push(task)
        end
      elsif (today - task.next_due_date).to_i % 7 == 0
        # weekly reminder, add to hash
        if !qualified_tasks.key?(task.user_id)
          qualified_tasks[task.user_id] = [task]
        else
          qualified_tasks[task.user_id].push(task)
        end
      else
        puts "Task doesn't qualify"
      end

    end
    p "Qualified tasks: "
    p qualified_tasks
  end

  def build_messages(qualified_tasks)
    # iterate through hash and build message
    messages = {}
    message = ""
    qualified_tasks.each do |user_id, tasks|
      user = User.find(user_id)

      tasks.each do |task|
        # if one task
        host = "https://remember-2-due.herokuapp.com/"
        goto_url = ""
        if tasks.count < 2
          goto_url = host + "tasks/#{task.id}"

          message = "Time to #{task.title}.\n\n"
          if task.task_histories.any?
            message += "Last time done was:\n#{task.task_histories.last.last_due_date.strftime("%B %Y")}\n\n"
          end
          message += "Goto todos: " + goto_url
        else
          # if more than one task
          goto_url = host
          message = "You have more than one task due. Goto todos: " + goto_url
        end
      end
    messages[user.text_number] = message
    end
    messages
  end

  def dispatch(messages_to_send)
    messages_to_send.map do |text_number, message|
      TwilioTextMessenger.new(message).send_message(text_number)
    end
  end
