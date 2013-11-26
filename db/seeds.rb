# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NEIGHBORHOODS = ["Midtown", "Downtown", "Uptown", "Brooklyn", "Queens"]

NEIGHBORHOODS.each do |neighborhood|
  Neighborhood.create(name: neighborhood)
end

# dan = User.create(name: "Daniel Chang", username: "supdelicious", email: "daniel.chang@flatironschool.com")
# 5.times {dan.items.build(name: "Default")}

# mike = User.create(name: "Mike Spangler", username: "bikespangler", email: "mike.spangler@flatironschool.com")
# 5.times {mike.items.build(name: "Default")}

# MANHATTAN = [ "Harlem", "Inwood", "Morningside Heights", "SpaHa", "Midtown East", "Midtown West", "Upper East Side", "Upper West Side", "Hell's Kitchen", "Murray Hill", "Gramercy", "Union Square", "Meatpacking District", "Chelsea", "Greenwich Village", "East Village", "West Village", "NoHo", "SoHo", "TriBeCa", "Downtown", "Chinatown", "Lower East Side", "Alphabet City"]

# BROOKLYN = [ "Downtown Brooklyn", "Williamsburg", "Dumbo", "Greenpoint", "Bushwick", "Canarsie", "East New York", "Bedford Stuyvesant", "Clinton Hill", "Fort Greene", "Brooklyn Heights", "Gowanus", "Park Slope", "Carroll Gardens", "Boerum Hill", "Red Hook", "Prospect Heights", "Crown Heights", "Prospect Lefferts Gardens", "Windsor Terrace", "Kensington", "Bensonhurst", "Sheepshead Bay", "Coney Island", "Flatbush", "Brownsville", "Navy Yard", "Bay Ridge", "Vinegar Hill", "Sunset Park", "Fort Hamilton", "Gravesand", "Midwood", "East Flatbush", "Flatlands", "Marine Park", "Cypress Hills", "Cobble Hill"]

# NEIGHBORHOODS = {'manhattan': MANHATTAN, 'brooklyn': BROOKLYN}

# NEIGHBORHOODS.each_value.each do |neighborhood|
#   Neighborhood.create(name: neighborhood)
# end