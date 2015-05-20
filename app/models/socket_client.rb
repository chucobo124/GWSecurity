class SocketClient < ActiveRecord::Base
	def self.givecommand(command)
		ip = '192.168.4.1'
		port = 4000
		tcpClient = TCPSocket.new ip, port
		tcpClient.print(command)
	end
private
	def client
		
	end
end