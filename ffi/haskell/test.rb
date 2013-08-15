    require 'ffi'

    module Hsc
      extend FFI::Library
      ffi_lib './Test.so'

      attach_function :tk_init, [:int, :pointer], :void
      attach_function :tk_exit, [], :void
      attach_function :hs_fact, [:int], :int
    end

    ptr1 = FFI::MemoryPointer.from_string("my ruby")
    ptr = FFI::MemoryPointer.new :pointer
    ptr.put_pointer 0, ptr1

    Hsc.tk_init 1, ptr

    10.times do |i|
      p Hsc.hs_fact(i)
    end

    Hsc.tk_exit
