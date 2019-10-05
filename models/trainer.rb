require_relative("../db/sql_runner")

class Trainer

  attr_accessor :trainer_name, :description, :size, :quantity, :buy_cost, :sell_price, :brand_id
  attr_reader :id


def initialize(options)
  @id = options["id"].to_i() if options["id"]
  @trainer_name = options["trainer_name"]
  @description = options["description"]
  @size = options["size"]
  @quantity = options["quantity"]
  @buy_cost = options["buy_cost"]
  @sell_price = options["sell_price"]
  @brand_id = options["brand_id"]
end
