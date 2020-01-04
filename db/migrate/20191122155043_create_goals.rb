class CreateGoals < ActiveRecord::Migration[5.1]
  def change
    create_table :goals do |t|
      t.string :descripcion
      t.date :fecinicio
      t.date :fecfin
      t.integer :cantmeta
      t.integer :faltameta
      t.integer :estado
  

      t.timestamps
    end
  end
end
