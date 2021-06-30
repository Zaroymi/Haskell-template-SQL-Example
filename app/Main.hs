module Main where

import Tests.HaskellBaseTest
import Tests.HaskellTemplateTest
import SQL.Queries
import SQL.Models
import Lib

main :: IO ()
main = do
  -- Point tests 
  let x = Point 1 2
  let y = Point 3 4
  let pointDistance = distance x y
  print pointDistance

  -- Lib
  lib <- func
  
  -- SQL 
  runQueries
  --
  print 1


