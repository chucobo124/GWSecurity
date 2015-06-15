class PersonInfosController < ApplicationController
before_action :getPersonInfo  
  def index
    @url =request.url
  end

  def new
  	@email = current_user.email
  end

  def create
  end

  def update
  	@PersonInfo.update(getPersonParams)
  	redirect_to :action => :index
  end

private
  def getPersonInfo
  	@currentUser = current_user.id
  	@PersonInfo = PersonInfo.myacount(@currentUser)
    @Permission = current_user.permission_sheet.permissionType
  end

  def getPersonParams
  	params.require(:person_info).permit(:name, :phone, :facebook, :line)
	end
end