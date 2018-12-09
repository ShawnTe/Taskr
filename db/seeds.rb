# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create({ username: "cleanMe", text_number: "650-549-5775"})
tasks = Task.create([
  {
    title: 'Clean the carpets',
    due: 2018_12_08,
    notes: 'Living Room, Family Room, Master Bed, 3 kids rooms. Schedule on a Weds, when all kids have after school activities.',
    frequency_unit: "years",
    frequency_number: 1,
    user_id: user.id
  },
  {
    title: 'Change water filter in fridge',
    due: 2019_01_15,
    notes: 'Have extra filters in garage.',
    frequency_unit: "months",
    frequency_number: 6,
    user_id: user.id
  }
])
