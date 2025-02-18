require_relative("../models/brand")
require_relative("../models/trainer")
require("pry")

Trainer.delete_all()
Brand.delete_all()


brand1 = Brand.new({"name" => "Adidas"})
brand2 = Brand.new({"name" => "Brooks" })
brand3 = Brand.new({"name" => "Asics"})

brand1.save()
brand2.save()
brand3.save()

trainer1 = Trainer.new({
  "trainer_name" => "Pulseboost",
  "description" => "Adidas Pulseboost HD Men's Running Shoes",
  "quantity" => 3,
  "buy_cost" => 10000,
  "sell_price" => 11900,
  "brand_id" => brand1.id
  })

trainer2 = Trainer.new({
  "trainer_name" => "Ultraboost",
  "description" => "Adidas Ultra Boost Men's Running Shoes",
  "quantity" => 4,
  "buy_cost" => 9000,
  "sell_price" => 10900,
  "brand_id" => brand1.id
  })

trainer3 = Trainer.new({
  "trainer_name" => "Adrenaline",
  "description" => "Brooks Adrenaline GTS 19 Men's Running Shoes",
  "quantity" => 1,
  "buy_cost" => 8000,
  "sell_price" => 10000,
  "brand_id" => brand2.id
  })

trainer4 = Trainer.new({
  "trainer_name" => "Cascadia",
  "description" => "Brooks Cascadia 14 Men's Running Shoes",
  "quantity" => 5,
  "buy_cost" => 8500,
  "sell_price" => 9900,
  "brand_id" => brand2.id
  })

trainer5 = Trainer.new({
  "trainer_name" => "Transcend",
  "description" => "Brooks Transcend 6 Men's Running Shoes",
  "quantity" => 3,
  "buy_cost" => 7000,
  "sell_price" => 8000,
  "brand_id" => brand2.id
  })

trainer6 = Trainer.new({
  "trainer_name" => "Gel Kayano",
  "description" => "Asics Gel-Kayano 25 Men's Running Shoes",
  "quantity" => 4,
  "buy_cost" => 8000,
  "sell_price" => 10000,
  "brand_id" => brand3.id
  })

trainer7 = Trainer.new({
  "trainer_name" => "gt-2000",
  "description" => "ASICS GT-2000 6 Men's Running Shoes",
  "quantity" => 1,
  "buy_cost" => 6000,
  "sell_price" => 7000,
  "brand_id" => brand3.id
  })

trainer8 = Trainer.new({
  "trainer_name" => "Gel Cumulus",
  "description" => "ASICS Gel-Cumulus 19 Men's Running Shoes",
  "quantity" => 2,
  "buy_cost" => 5500,
  "sell_price" => 6000,
  "brand_id" => brand3.id
  })

trainer1.save()
trainer2.save()
trainer3.save()
trainer4.save()
trainer5.save()
trainer6.save()
trainer7.save()
trainer8.save()

binding.pry
nil
