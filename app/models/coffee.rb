# Coffee Class
class Coffee < ActiveRecord::Base

  validates :name, :presence => true, length: { minimum: 5 }
  validates :coffee_list_id, :presence => true, numericality: { only_integer: true }
  validates :prep_method, :presence => true
  validates :rating, :presence => true, numericality: { only_integer: true }
  validates :origin, :presence => true
  validates :roast, :presence => true
  validates :notes, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed" }

  belongs_to :coffee_list
end