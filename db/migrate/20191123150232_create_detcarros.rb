class CreateDetcarros < ActiveRecord::Migration[5.1]
  def change
    create_table :detcarros do |t|
      t.integer :cantidad

      t.references :productos, foreign_key: true

      t.timestamps
    end
  end
end
