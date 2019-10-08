require_relative("../db/sql_runner")
require("pry")

class Brand

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO brands
    (name)
    VALUES ($1)
    RETURNING *"
    values = [@name]
    brand_data = SqlRunner.run(sql, values)
    @id = brand_data.first()["id"].to_i()
  end

  def update()
    sql = "UPDATE brands
    SET (name) = $1
    where id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def Brand.find(id)
    sql = "SELECT * from brands
    WHERE id = $1"
    values = [id]
    brand = SqlRunner.run(sql, values)
    result = Brand.new(brand.first)
    return result
  end

  def Brand.all()
    sql = "SELECT * FROM brands"
    brands = SqlRunner.run(sql)
    result = brands.map{ |brand| Brand.new( brand)}
    return result
  end

  def Brand.delete(id)
    sql = "DELETE FROM brands
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def Brand.delete_all
    sql = "DELETE FROM brands"
    SqlRunner.run(sql)
  end

end
