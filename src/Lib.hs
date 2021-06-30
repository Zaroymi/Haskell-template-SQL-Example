{-# LANGUAGE TemplateHaskell #-}

module Lib where

import Tests.HaskellTemplateTest

func :: IO ()
func = do
  let $(genVar (varName ++ "1")) = 1
  let $(genVar "test2") = 10
  let diff = $(genDiffereceFunc "s" "t")
  let result = diff 2 1
  print result