class Order < ApplicationRecord

	#belongs_to :use
	belongs_to :user, optional: true
end
