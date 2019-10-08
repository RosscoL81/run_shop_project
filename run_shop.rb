require("sinatra")
require("sinatra/contrib/all")
require_relative("controllers/brands_controller")
require_relative("controllers/trainers_controller")
also_reload("./models/*")

get "/" do
  erb( :index)
end
