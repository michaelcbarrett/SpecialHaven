class VideoPost < ActiveRecord::Base
	acts_as :post
	validates :url, presence: true
end
