require 'ffi'
require 'benchmark'

module Fact
  extend FFI::Library
  ffi_lib 'factorial.dylib'

  attach_function :factorial, [ :int ], :int
end

def fact n
  return 1 if n == 0
  (1..n).inject(1) {|r, x| r *= x }
end

p Benchmark.realtime { 1000.times { Fact.factorial 10 } }

p Benchmark.realtime { 1000.times { fact 10 } }

# >> 0.000228
# >> 0.001611
