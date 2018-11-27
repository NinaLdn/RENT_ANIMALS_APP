class AddPicturesToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :photo, :string
  end
end
