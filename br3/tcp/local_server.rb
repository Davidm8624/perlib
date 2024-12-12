require 'socket'

server = TCPServer.new(1234)

while connection = server.accept
  while line = connection.gets
    break if line.include?('quit')

    Rails.logger.debug line
    connection.puts 'Recieved!'
  end
  connection.puts 'closing the connection bye!'
  connection.close
end
