class Product < ActiveRecord::Base
	belongs_to :categories
	has_many :photos

	accepts_nested_attributes_for :photos, :allow_destroy => true
end
