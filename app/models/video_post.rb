class VideoPost < ActiveRecord::Base
	acts_as :post
	validates :url, presence: true

	def youtube_id
		match = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/i.match(self.url)
		if match.nil?
			return nil
		end
		return match[1]
	end
end
