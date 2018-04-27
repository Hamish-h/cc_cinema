require("pry")

require_relative("../models/film.rb")
require_relative("../models/ticket.rb")
require_relative("../models/customer.rb")

# Film.delete_all()
# Ticket.delete_all()
# Customer.delete_all()

Film1 = Film.new({
  "title" => "Doom",
  "ticket_price" => 500
})
Film1.save()

Film2 = Film.new({
  "title" => "Star Wars, The Empire Strikes Back",
  "ticket_price" => 500
})
Film2.save()

Film3 = Film.new({
  "title" => "Tron",
  "ticket_price" => 500
})
Film3.save()

customer1 = Customer.new({
  "name" => "William Goldman",
  "funds" => 1000
})
customer1.save()

customer2 = Customer.new({
  "name" => "S. Morgenstern",
  "funds" => 1000
})
customer2.save()

customer1 = Customer.new({
  "name" => "Inigo Montoya",
  "funds" => 1000
})
customer3.save()

# ticket1 = Ticket.new({
#   "customer_id" => customer1.id
#   "film_id" => film1.id})
# ticket1.save()

binding.pry
nil
