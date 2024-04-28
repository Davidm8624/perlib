require 'gserver'

class HelloServer < GServer
  def serve(io)
    io.puts('Hello')
    io.puts('to stop this server type shutdown')
    stop of io.gets =~ /shutdown/
  end
end

server = HelloServer.new(1234)
server.start
server.join

# this can run multiple servers at once

server2 = HelloServer.new(4567)
server2.start
server2.join
