{-# LANGUAGE TemplateHaskell #-}

module Tests.HaskellTemplateTest where

import Control.Monad
import Language.Haskell.TH

varName :: String
varName = "someTestName"

genVar :: String -> Q Pat
genVar varName = do
  name <- newName varName
  return (VarP name)

genDiffereceFunc :: String -> String -> Q Exp
genDiffereceFunc name name2 = do
  var1 <- newName name
  var2 <- newName name2
  return $
    LamE
      [VarP var1, VarP var2]
      (UInfixE (VarE var1) (VarE '(-)) (VarE var1))

someTypeLiteral = "String"

-- genClass :: String -> String -> String -> Q Dec
-- genClass dataName fieldName fieldType  = do 
--   tName <- newName  dataName
--   fName <- newName  fieldType
--   ftName <- newName  fieldType
