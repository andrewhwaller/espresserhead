require_relative './config/environment'

use Rack::MethodOverride
use UsersController
use CoffeesController
use CoffeeListsController
run ApplicationController
