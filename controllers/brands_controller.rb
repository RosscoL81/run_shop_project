require("sinatra")
require("sinatra/contrib/all")
require("pry")

require_relative("../models/brand")
also_reload("../models/*")

get "/brands" do
  @brands = Brand.all()
  erb (:"brands/index")
end


get "/brands/new" do
  erb (:"brands/new")
end

get "/brands/:id" do
  @brand = Brand.find(params[:id])
  erb (:"brands/show")
end

post "/brands" do
  @brands = Brand.new(params)
  @brands.save()
  redirect to "/trainers/new"
end

post "/brands/:id/delete" do
  Brand.delete(params[:id])
  redirect to "/brands"
end
