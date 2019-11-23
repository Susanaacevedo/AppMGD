class AddDetailsToCarros < ActiveRecord::Migration[5.1]
  def change
    add_column :carros, :estado, :boolean
  end
end
