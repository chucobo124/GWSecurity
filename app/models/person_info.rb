class PersonInfo < ActiveRecord::Base
	belongs_to :user
	def self.myacount(userID)
	  self.where(userId: userID).take
	end
end
