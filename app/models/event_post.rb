class EventPost < ActiveRecord::Base
	acts_as :post
	validates :event_start_time, presence: true
	validates :event_end_time, presence: true
	validates :location, presence: true
end
