class CreateBillings < ActiveRecord::Migration[5.1]
  def change
    create_table :billings do |t|
      t.string :code
      t.string :payment_method
      t.decimal :amount, precision: 10, scale: 1
      t.string :currency
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
