require_relative("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :customer_id, :ticket_id

  def initialize(options)
      @id = options["id"].to_i if options["id"]
      @customer_id = options["customer_id"].to_i
      @ticket_id = options["ticket_id"].to_i
    end

end
