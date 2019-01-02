user = User.create({ username: "cleanMe", text_number: "650-549-5775"})

task1 = Task.create({
    title: 'Change water filter in fridge',
    first_due_date: Time.new(2019,01,15),
    last_date_done: Time.new(2018,01,15),
    notes: 'Have extra filters in garage.',
    frequency_unit: "months",
    frequency_number: 6,
    user_id: user.id
  })

supply_detail = SupplyDetail.create({
  name: "filters",
  size: "300 gal",
  quantity: 1,
  brand: "Amana",
  model: "UKF8001AXX",
  source: "Discount Filters",
  source_link: "https://www.discountfilters.com/",
  how_to_link: "https://producthelp.amana.com/Refrigeration/Water_Filter_Information/Installation_Support/VIDEO%3A_How_to_Change_the_Water_Filter_(Push_Button)"
})

details_supply = task1.details.build({todo_type: SupplyDetail, todo_id: supply_detail.id })
details_supply.save

task2 = Task.create({
    title: 'Clean the carpets',
    first_due_date: Time.new(2019,01,31),
    last_date_done: Time.new(2018,01,31),
    notes: 'Living Room, Family Room, Master Bed, 3 kids rooms. Schedule on a Weds, when all kids have after school activities.',
    frequency_unit: "years",
    frequency_number: 1,
    user_id: user.id
  })

contact_detail = ContactDetail.create({
  company: 'Carpets-R-Us',
  name: "Larry Lindy",
  url: "www.carpets-r-us.com",
  work_phone: "650-555-1212",
  mobile_phone: "650-549-1212",
  notes: "They have specials every spring.",
  email: "larry@carpets-r-us.com"
})

details_contact = task2.details.build({todo_type: ContactDetail, todo_id: contact_detail.id })
details_contact.save

Frequency.create(unit: "months")
Frequency.create(unit: "years")
Frequency.create(unit: "weeks")
Frequency.create(unit: "days")

