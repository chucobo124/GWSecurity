class MachineListsController < ApplicationController  
  def index
  	@commandLine = params[:commandLine]
    # unless @commandLine.empty?
  	 #  SocketClient.givecommand(@commandLine)
    # end
  end
private
  def scanPermission
   	permissionId = currentUser.permissionId
  end
end
