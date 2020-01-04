class CreatePagos < ActiveRecord::Migration[5.1]
  def change
    create_table :pagos do |t|
      t.date :fecpago
      t.boolean :estado
      t.integer :tipentrega
      t.integer :cantotal


      t.timestamps
    end
  end
end
