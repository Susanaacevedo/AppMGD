class ChangeDataTypeForPrecio < ActiveRecord::Migration[5.1]
  def change
    change_column :detcarros, :precio, 'integer USING CAST(precio AS integer)'
  end
end
