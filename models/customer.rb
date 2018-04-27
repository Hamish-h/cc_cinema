require_relative("../db/sql_runner")
require_relative("film")

class Customer
  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
      @id = options["id"].to_i if options["id"]
      @name = options["name"]
      @funds = options["funds"].to_i
    end

  def save()
      sql = "INSERT INTO customers (name, funds) values ($1, $2) RETURNING id"
      values = [@name, @funds]
      customer = SqlRunner.run(sql, values).first()
      @id = customer["id"].to_i
    end

    def update()
      sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
      values = [@name, @funds, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM customers WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM customers;"
      SqlRunner.run(sql)
    end

    def find_customer_films
      sql = "SELECT films.* FROM customers
      INNER JOIN tickets ON customers.id = tickets.customer_id
      INNER JOIN films ON tickets.film_id = films.id
      WHERE customers.id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      result = results.map{|hash| Film.new(hash)}
      return result
    end
end
