class RemovePhotoLinkProduct < ActiveRecord::Migration
  def down
  	remove_column :products, :photo_link
  end
end
