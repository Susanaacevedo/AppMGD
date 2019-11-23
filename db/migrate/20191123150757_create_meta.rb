class CreateMeta < ActiveRecord::Migration[5.1]
  def change
    create_table :meta do |t|
      t.string :descripcion
      t.date :fecinicio
      t.date :fecfin
      t.integer :cantmeta
      t.integer :faltameta
      t.boolean :estado
      t.references :pagos, foreign_key: true

      t.timestamps
    end
  end
end
