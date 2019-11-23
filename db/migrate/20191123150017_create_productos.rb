class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
      t.integer :codigo
      t.string :nombre
      t.integer :precio
      t.integer :stock

      t.timestamps
    end
  end
end
