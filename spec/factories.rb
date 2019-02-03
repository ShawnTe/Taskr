FactoryBot.define do

  factory :user do
    username { "Joe" }
    email { "joe@gmail.com" }
    text_number { "408-555-1212" }
    password { "blah" }
  end

  date_due = Date.new(2019, 03, 03)
  date_done = Date.new(2018, 02, 04)


  factory :task do
    title { "Clean carpets" }
    next_due_date { date_due }
    notes { "Living room, hall, bedroom" }
    frequency_unit { "years" }
    frequency_number { 1 }
    user
    date_completed { date_done }
  end

  factory :supply_detail do
    name { "carpet spoptter" }
    size { "can" }
    quantity { 1 }
    supply_notes { "These are notes specific to the supply" }
  end

  factory :detail do
    association :todo, factory: :supply_detail
    task
  end

end