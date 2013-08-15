Signal.trap("INT") {
  puts "received INT"
  exit
}
Signal.trap("QUIT") {
  puts "received QUIT";
  exit
}
Signal.trap("KILL") {
  puts "received KILL, but I refuse to go!";
}
Signal.trap("USR1") {
  puts "received USR1"
  puts "I think the time is #{Time.now.to_i}"
}
puts Process.pid
sleep
