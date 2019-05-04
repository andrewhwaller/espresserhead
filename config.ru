require_relative './config/environment'

use Rack::MethodOverride
use UsersController
use CoffeesController
use CoffeeshopsController
use CoffeeListsController
run ApplicationController
