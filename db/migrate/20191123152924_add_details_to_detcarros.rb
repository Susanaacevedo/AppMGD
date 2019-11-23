class AddDetailsToDetcarros < ActiveRecord::Migration[5.1]
  def change
    add_column :detcarros, :precio, :string
  end
end
