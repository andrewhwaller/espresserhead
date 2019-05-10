class AddCoffeelistDescriptionColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :coffee_lists, :list_description, :text
  end
end
