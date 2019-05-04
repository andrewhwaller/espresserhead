# Coffee List Class
class CoffeeList < ActiveRecord::Base
  belongs_to :user
  has_many :coffees
end
