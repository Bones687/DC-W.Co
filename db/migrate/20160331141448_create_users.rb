class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.enum :type 

      t.timestamps
    end
  end
end
