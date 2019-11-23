class CreatePagos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagos do |t|
      t.date :fecpago
      t.boolean :estado
      t.integer :tipentrega
      t.integer :cantotal
      t.references :carros, foreign_key: true

      t.timestamps
    end
  end
end
