require 'ffi'
require 'benchmark'

module LibC
  extend  FFI::Library
  ffi_lib FFI::Library::LIBC

  attach_function :puts, [:string], :int
  attach_function :strcat, [:string, :string], :string
  attach_function :strncat, [:string, :string, :size_t], :string
end

res = []

res << Benchmark.realtime do
  10000.times{ LibC.strcat("Hello world, ", "from ruby") }
  LibC.puts "Hello"
end


res << Benchmark.realtime do
  10000.times{ "Hello world, " + "from ruby" }
  puts "Hello"
end

p res
