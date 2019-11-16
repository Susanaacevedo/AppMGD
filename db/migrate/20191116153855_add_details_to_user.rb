class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :telefono, :string
    add_column :users, :direccion, :string
    add_column :users, :rut, :string
    add_column :users, :role, :boolean
    add_column :users, :foto, :string
  end
end
