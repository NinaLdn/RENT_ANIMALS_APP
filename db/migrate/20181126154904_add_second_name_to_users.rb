class AddSecondNameToUsers < ActiveRecord::Migration[5.2]
  def change
     add_column :users, :second_name, :string
  end
end
