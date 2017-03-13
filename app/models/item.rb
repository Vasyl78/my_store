class Item < ApplicationRecord

	validates :price,  numericality: {greater_than: 0, allow_nil: true }
	validates :price,  presence: true

	#has_and_belongs_to_many :carts

	has_many :positions
	has_many :carts, through: :positions

	has_many :comments, as: :commentable

	#belongs_to :category
#
	#after_initialize  { }
	#after_save       { }
	#after_create     { category.inc(:items_count, 1) }
	#after_update     { }
	#after_destroy    {  category.inc(:items_count, -1) }
end
