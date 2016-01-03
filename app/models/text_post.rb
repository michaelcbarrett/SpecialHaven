class TextPost < ActiveRecord::Base
	acts_as :post
	belongs_to :user
end
