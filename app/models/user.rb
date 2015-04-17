class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :personInfo

  def self.resourceId(params)
		self.select(:id).where(email: params[:user][:email]).take.id
	end
end
