{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

module SQL.Queries where
import SQL.Models

import Control.Monad.IO.Class (liftIO)

import Database.Persist.Sqlite
import Database.Persist
import Database.Persist.Sql
import Data.Text
import Database.Persist.TH

runQueries :: IO ()
runQueries = runSqlite ":memory:" $ do
    liftIO $ print "Migration"
    runMigration migrateAll

    liftIO $ print "Insert"
    userId <- insert $ User "USERNAME" "test@mail.com" 35
    insert $ Message "Very cool message" userId
    
    liftIO $ print "Select"
    
    -- user select 
    user <- selectList [UserId ==. userId] [Asc UserId, LimitTo 1]
    liftIO $ print (user :: [Entity User])

    -- message select
    message <- selectList [MessageUserId  ==. userId] [LimitTo 1]
    liftIO $ print (message :: [Entity Message])