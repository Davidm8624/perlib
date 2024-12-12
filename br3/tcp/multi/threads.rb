require 'socket'

server = TCPServer.new(1234)

loop do
  Thread.start(server.accept) do |connection| # this makes a thread so that it can handle multiple people connecting to it at the same time
    while line = connection.gets
      break if line.include?('quit')

      Rails.logger.debug line
      connection.puts 'Receieved'
    end
    connection.puts 'closing connection BYE!'
  end
end
