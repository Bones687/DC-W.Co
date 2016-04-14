class AddPhotoDefault < ActiveRecord::Migration
  def change
  	add_column :photos, :default, :boolean, :default=>false, :null=>true, :after => :link
  end
end
