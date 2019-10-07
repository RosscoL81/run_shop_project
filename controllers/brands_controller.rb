require("sinatra")
require("sinatra/contrib/all")
require("pry")

require_relative("../models/brand")
also_reload("../models/*")
