require_relative("../db/sql_runner")

class Customer
  attr_reader :id
  attr_accessor :customer_id, :ticket_id

  def initialize(options)
      @id = options["id"].to_i if options["id"]
      @customer_id = options["customer_id"].to_i
      @ticket_id = options["ticket_id"].to_i
    end

  def save()
      sql = "INSERT INTO customer (name, funds) values ($1, $2) RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first()
      @id = customer["id"].to_i
    end

    def update()
      sql = "UPDATE customer SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM films WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

end
