class AddProductoToDetcarro < ActiveRecord::Migration[5.1]
  def change
    add_reference :detcarros, :producto, foreign_key: true
  end
end
