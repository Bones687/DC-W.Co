class AddPhotoLinkCategories < ActiveRecord::Migration
  def change
  	add_column :categories, :photo_link, :string, :default=>false, :null=>true, :after => :name
  end
end
