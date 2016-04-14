class AddProductDescription < ActiveRecord::Migration
  def change
  	add_column :products, :description, :string, :default=>nil, :null=>true, :after => :quantity
  end
end
