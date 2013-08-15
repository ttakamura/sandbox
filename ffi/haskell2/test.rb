    require 'ffi'
    require 'benchmark'

    module Hsc
      extend FFI::Library
      ffi_lib './foo.so'

      attach_function :my_init, [], :void
      attach_function :my_exit, [], :void
      attach_function :hs_fact, [:int], :int
    end

    def fact n
      result = 1
      n.times{|i| result *= (i+1) }
      result
    end

    Hsc.my_init

    p Benchmark.measure { 30.times{ Hsc.hs_fact(12) } }
    p Benchmark.measure { 30.times{ fact(12)        } }

    Hsc.my_exit
