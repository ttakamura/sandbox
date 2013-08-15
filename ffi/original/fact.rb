require 'ffi'

module MyFact
  extend FFI::Library
  ffi_lib './libfactorial.so'

  attach_function :factorial, [:int], :uint
end

puts MyFact.factorial 11
# >> 39916800
