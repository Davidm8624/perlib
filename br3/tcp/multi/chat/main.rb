require 'gserver'

class ChatServer < GServer
  def initialize(*args)
    super(*args)
    # keep overall record of client id's and chat lines
    @client_id = 0
    @chat = []
  end

  def server(io)
    @client_id += 1
    my_client_id = @client_id
    my_position = @chat.size
    # greets the new user
    io.puts("welcome to the chat client #{client_id}")
    # lets users in the chat see that a new user has joined
    @chat << [my_client_id, '<joins the chat>']

    loop do
      # every 2 sec fetch updates
      if IO.select([io], nil, nil, 2)
        # if so grab the new lines and process it
        line = io.gets

        # if user says quit disconnect them
        if line =~ /quit/
          @chat << [my_client_id, '<leaves the chat>']
          break
        end
        # shutdown if we hear shutdown
        stop if line =~ /shutdown/

        # add the client text to the chat array with the id
        @chat << [my_client_id, line]
      else
        # no data so print any new lines from the chat stream
        @chat[my_position..(@chat.size - 1)].each_with_index do |line, index|
          io.puts("#{line[0]} says: #{line[1]}")
        end
        # move the position to one past the end of the array
        my_position = @chat.size
      end
    end
  end
end

server = ChatServer.new(1234)
server.start

loop do
  break if server.stopped? # this does not stop the server, just stops this ruby file from running if server is stopped
end
