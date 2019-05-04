class CreateCoffeeListsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_lists do |t|
      t.string :list_name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
