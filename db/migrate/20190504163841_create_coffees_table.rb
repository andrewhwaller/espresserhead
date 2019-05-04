class CreateCoffeesTable < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :name
      t.integer :coffee_list_id
      t.string :prep_method
      t.integer :rating
      t.string :origin
      t.string :roast
      t.text :notes
      t.timestamps null: false
    end
  end
end
