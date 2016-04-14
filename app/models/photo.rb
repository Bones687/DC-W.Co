class Photo < ActiveRecord::Base
  belongs_to :products
  #validates_presence_of :link
  mount_uploader :link, ImageUploader
end
