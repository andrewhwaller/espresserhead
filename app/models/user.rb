# User class
class User < ActiveRecord::Base
  has_secure_password

  has_many :coffee_lists
  has_many :coffees, through: :coffee_lists
end
