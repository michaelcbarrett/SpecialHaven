class ImagePost < ActiveRecord::Base
	acts_as :post
	validates :image_url, presence: true 
end
