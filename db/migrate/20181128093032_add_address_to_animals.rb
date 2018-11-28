class AddAddressToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :address, :string
  end
end
