require("sinatra")
require("sinatra/contrib/all")
require("pry")

require_relative("../models/trainer")
require_relative("../models/brand")
also_reload("../models/*")

get "/trainers" do
  @trainers = Trainer.all()
  erb (:"trainers/index")
end

get "/trainers/new" do
  @brands = Brand.all()
  erb (:"trainers/new")
end

get "/trainers/:id" do
  @trainers = Trainer.find(params[:id])
  erb (:"trainers/show")
end



post "/trainers" do
  @trainers = Trainer.new(params)
  @trainers.save()
  redirect to "/trainers"
end
