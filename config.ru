require_relative './config/environment'

use Rack::MethodOverride
use UserController
use CoffeeController
use CoffeeshopController
run ApplicationController