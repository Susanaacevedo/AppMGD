class AddPhotoToProductos < ActiveRecord::Migration[5.1]
  def change
    add_column :productos, :photo, :string
  end
end
