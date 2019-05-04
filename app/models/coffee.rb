class Coffee < ActiveRecord::Base
    belongs_to :users
    has_many :coffee_lists
end