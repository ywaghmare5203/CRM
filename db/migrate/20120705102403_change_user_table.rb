class ChangeUserTable < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :password_hash, :crypted_password

      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      t.string :perishable_token
    end
  end
end
