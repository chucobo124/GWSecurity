class PersonInfo < ActiveRecord::Base
	belongs_to :user
  has_many :cards
	def self.myacount(userID)
	  self.where(userId: userID).take
	end
end
