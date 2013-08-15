require 'socket'

bind_port    = 8888
connect_port = 7777
connect_addr = "192.241.203.232"
NAME         = "Client A"

def try_open max = 100
  count = 0
  begin
    puts "try connect .... #{ count }"
    yield
  rescue Errno::ECONNREFUSED
    puts "#{ NAME } - Error::ECONNREFUSED"
    count += 1
    retry if (count < max)
  end
  puts "end because reach to max!!"
end

socket = nil

try_open do
  begin
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    socket.bind Socket.sockaddr_in(bind_port, "0.0.0.0")
    socket.connect Socket.sockaddr_in(connect_port, connect_addr)
  rescue => e
    socket.close
    raise e
  end
end

socket.write "Hello from #{NAME}\n"
print "#{NAME}: " + socket.readline

socket.close
