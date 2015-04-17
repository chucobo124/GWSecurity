class PersonInfosController < ApplicationController
  before_action :authenticate_user!
  def index
  	currentUser = current_user.id
  	@PersonInfo = PersonInfo.myacount(currentUser)
  end
end
