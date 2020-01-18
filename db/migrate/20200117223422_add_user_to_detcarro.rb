class AddUserToDetcarro < ActiveRecord::Migration[5.1]
  def change
    add_reference :detcarros, :user, foreign_key: true
  end
end
