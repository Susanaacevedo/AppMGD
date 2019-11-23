class CreateCarros < ActiveRecord::Migration[5.1]
  def change
    create_table :carros do |t|
      t.integer :total
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
