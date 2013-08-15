{-# LANGUAGE ForeignFunctionInterface #-}
module Foo where

import Foreign.C.Types

foreign export ccall hs_fact :: CInt -> CInt

hs_fact :: CInt -> CInt
hs_fact 0 = 1
hs_fact n = n * hs_fact (n - 1)
