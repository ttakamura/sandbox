require 'ffi'
require 'pp'

module MyLibc
  extend FFI::Library
  ffi_lib FFI::Library::LIBC
  attach_function :getpid, [], :int

  class UTSName < FFI::Struct
    layout :sysname, [:char, 65],
           :nodename, [:char, 65],
           :release, [:char, 65],
           :version, [:char, 65],
           :machine, [:char, 65],
           :domainname, [:char, 65]

    def to_hash
      Hash[members.zip values.map(&:to_s)]
    end
  end

  attach_function :uname, [:pointer], :int
  def self.uname_info
    uts = UTSName.new
    raise 'uname unavaliable' if uname(uts) != 0
    uts.to_hash
  end
end

puts MyLibc.getpid
puts $$

pp MyLibc.uname_info
