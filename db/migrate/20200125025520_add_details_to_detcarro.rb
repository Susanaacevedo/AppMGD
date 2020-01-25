class AddDetailsToDetcarro < ActiveRecord::Migration[5.1]
  def change
    add_column :detcarros, :payed, :boolean
  end
end
