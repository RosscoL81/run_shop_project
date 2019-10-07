require_relative("../db/sql_runner")
require_relative("./brand")


class Trainer

  attr_accessor :trainer_name, :description, :quantity, :buy_cost, :sell_price, :brand_id
  attr_reader :id


  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @trainer_name = options["trainer_name"]
    @description = options["description"]
    @quantity = options["quantity"].to_i()
    @buy_cost = options["buy_cost"].to_i()
    @sell_price = options["sell_price"].to_i()
    @brand_id = options["brand_id"]
  end

  def update()
    sql = "UPDATE trainers
    SET
    (trainer_name,
    description,
    quantity,
    buy_cost,
    sell_price,
    brand_id) =
    ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@trainer_name, @description, @quantity, @buy_cost, @sell_price, @brand_id]
    SqlRunner.run(sql, values)
  end

  def save()
    sql = "INSERT INTO trainers
    (
      trainer_name,
      description,
      quantity,
      buy_cost,
      sell_price,
      brand_id
      )
      VALUES
      ($1, $2, $3, $4, $5, $6)
      RETURNING id"
      values = [@trainer_name, @description, @quantity, @buy_cost, @sell_price, @brand_id]
      trainer_data = SqlRunner.run(sql, values)
      @id = trainer_data.first()["id"].to_i()
    end



    def brand()
      sql = "SELECT * FROM brands WHERE id = $1"
      values = [@brand_id]
      results = SqlRunner.run(sql, values)
      brand_hash = results[0]
      brand = Brand.new(brand_hash)
      return brand
    end

    def Trainer.find(id)
      sql = "SELECT * FROM trainers WHERE id =$1"
      values = [id]
      trainer = SqlRunner.run(sql, values)
      results = Trainer.new(trainer.first)
      return results
    end


    def Trainer.all()
      sql = "SELECT * FROM trainers"
      trainers = SqlRunner.run(sql)
      result = trainers.map{ |trainer| Trainer.new (trainer) }
      return result
    end


  end
