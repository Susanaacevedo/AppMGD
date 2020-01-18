class AddUseridToDetcarros < ActiveRecord::Migration[5.1]
  def change
    add_reference :detcarros, :user, foreign_key: true
    add_reference :detcarros, :producto, foreign_key: true
  end
end
