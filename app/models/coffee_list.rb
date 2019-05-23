# Coffee List Class
class CoffeeList < ActiveRecord::Base
  validates :list_name, :presence => true, length: { minimum: 5 }
  validates :list_description, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed" }

  belongs_to :user
  has_many :coffees
end
