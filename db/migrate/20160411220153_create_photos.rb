class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :link
      t.boolean :default
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
