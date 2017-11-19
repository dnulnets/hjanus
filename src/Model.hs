{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
module Model where

import ClassyPrelude.Yesod
import Database.Persist.Quasi
import Database.Persist.MongoDB hiding (master)
import Language.Haskell.TH.Syntax
import Model.UserBase

import Yesod.Auth.HashDB (HashDBUser(..))

-- Create the persistence model
let mongoSettings = (mkPersistSettings (ConT ''MongoContext))
 in share [mkPersist mongoSettings]
    $(persistFileWith upperCaseSettings "config/models")

-- The user for the hash database authentication
instance HashDBUser User where
    userPasswordHash = userPassword
    setPasswordHash h u = u { userPassword = Just h }
