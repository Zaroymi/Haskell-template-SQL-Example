module Tests.HaskellBaseTest where

data Point = Point
  { pointX :: Float,
    pointY :: Float
  }

distance :: Point -> Point -> Float
distance x y = sqrt ((pointX x - pointX y) ^ 2 + (pointY x - pointY y) ^ 2)
