require_relative("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :ticket_price

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @ticket_price = options["ticket_price"].to_i
  end

  def save()
    sql = "INSERT INTO films (title, ticket_price) values ($1, $2) RETURNING id"
    values = [@title, @ticket_price]
    film = SqlRunner.run(sql, values).first()
    @id = film["id"].to_i
  end

  def update()
    sql = "UPDATE films SET (title, ticket_price) = ($1, $2) WHERE id = $3"
    values = [@title, @ticket_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def self.map_items(items)
  return items.map { |item| self.new(item)}
  end
end
