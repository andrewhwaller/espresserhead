# User class
class User < ActiveRecord::Base
  has_secure_password

  validates :username, :presence => true,
                       :uniqueness => true
  validates :email,    :presence => true,
                       :uniqueness => true
  validates :password, :presence => true

  has_many :coffee_lists
  has_many :coffees, through: :coffee_lists
end
