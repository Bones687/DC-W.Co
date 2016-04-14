class AddPhotoColumnProduct < ActiveRecord::Migration
  def change
  	add_column :products, :photo_link, :string, :default=>nil, :null=>true, :after => :category_id
  end
end
