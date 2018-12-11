user = User.create({ username: "cleanMe", text_number: "650-549-5775"})

task1 = Task.create({
    title: 'Change water filter in fridge',
    due: 2019_01_15,
    notes: 'Have extra filters in garage.',
    frequency_unit: "months",
    frequency_number: 6,
    user_id: user.id
  })

supply = Supply.create({
  name: "filters",
  size: "300 gal",
  quantity: 1,
  brand: "Amana",
  model: "UKF8001AXX",
  source: "Discount Filters",
  source_link: "https://www.discountfilters.com/refrigerator-water-filters/clearchoice-clch101-3-pack/p180376/?poiu%5B0%5D=180378%2C180362.05&poiu%5B1%5D=180377%2C180349.1&poiu%5B2%5D=180376%2C180340.15&poiu%5B3%5D=184695%2C184629.3&alt_name=Replacement+For+Amana+UKF8001AXX+Refrigerator+Water+Filters&utm_source=google&utm_medium=shopping&utm_campaign=google_base&gclid=EAIaIQobChMIroGFr_uB3wIVBAZpCh1wRQGEEAQYAiABEgKNEvD_BwE",
  how_to_link: "https://producthelp.amana.com/Refrigeration/Water_Filter_Information/Installation_Support/VIDEO%3A_How_to_Change_the_Water_Filter_(Push_Button)"
})

details_supply = task1.details.build({todo_type: Supply, todo_id: supply.id })
details_supply.save

task2 = Task.create({
    title: 'Clean the carpets',
    due: 2018_12_08,
    notes: 'Living Room, Family Room, Master Bed, 3 kids rooms. Schedule on a Weds, when all kids have after school activities.',
    frequency_unit: "years",
    frequency_number: 1,
    user_id: user.id
  })

contact = Contact.create({
  company: 'Carpets-R-Us',
  name: "Larry Lindy",
  url: "www.carpets-r-us.com",
  work_phone: "650-555-1212",
  mobile_phone: "650-549-1212",
  notes: "They have specials every spring.",
  email: "larry@carpets-r-us.com"
})

details_contact = task2.details.build({todo_type: Contact, todo_id: contact.id})
details_contact.save

