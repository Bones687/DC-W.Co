class AddAdmin < ActiveRecord::Migration
  def change
  	add_column :users, :admin, :boolean, :default=>false, :null=>false, :after => :zip
  end
end
