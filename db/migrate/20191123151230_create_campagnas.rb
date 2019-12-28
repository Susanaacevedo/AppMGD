class CreateCampagnas < ActiveRecord::Migration[5.1]
  def change
    create_table :campagnas do |t|
      t.string :nombre
      t.references :pagos, foreign_key: true
      t.references :goals, foreign_key: true

      t.timestamps
    end
  end
end
