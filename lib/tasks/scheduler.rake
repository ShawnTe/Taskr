namespace :message_tasks do
  desc "Send text messages for due and past due tasks"
  task :send_text_to_users => :environment do
    message_builder = MessageBuilder.new
    qualified_tasks = message_builder.check_due_dates(Task.incomplete)
    messages = message_builder.build_messages(qualified_tasks)
    message_builder.dispatch(messages)
  end

  desc "Send one time message to all users"
  task :send_single_message => :environment do
    message_builder = MessageBuilder.new

    single_messages = message_builder.single_message_to_send(User.all)
    message_builder.dispatch(single_messages)
  end
end