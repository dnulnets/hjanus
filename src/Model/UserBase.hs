{-# LANGUAGE EmptyDataDecls             #-}
{-# LANGUAGE FlexibleInstances          #-}
{-# LANGUAGE GADTs                      #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE NoImplicitPrelude          #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeFamilies               #-}
module Model.UserBase (UserRole(..)) where

import ClassyPrelude.Yesod

-- | The hard coded roles a user can have in Janus.
data UserRole = Administrator |
                Writer |
                Reader
                deriving (Show, Read, Eq)

derivePersistField "UserRole"
