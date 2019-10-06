require_relative("../db/sql_runner")

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

    
  end
