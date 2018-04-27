require("pry")

require_relative("../models/customer.rb")
require_relative("../models/film.rb")
require_relative("../models/ticket.rb")

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
