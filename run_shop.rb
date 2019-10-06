require("sinatra")
require("sinatra/contrib/all")
# require_relative("controllers/brands_controller")
# require_relative("controlkers/trainers_controller")

get "/" do
  erb( :index)
end
