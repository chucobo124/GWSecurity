class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :personInfo
  belongs_to :permission_sheet, :foreign_key => 'permissionId'

  def self.resourceId(params)
		self.select(:id).where(email: params[:user][:email]).take.id
	end

  def self.saveSuperUserPermission(id)
  	if id == 1
        currentUser = User.find(id)
        currentUser.update(:permissionId => id)
  		return id
  	else
       id = 4
       currentUser.update(:permissionId => id)
  		return id
  	end
  end
end
