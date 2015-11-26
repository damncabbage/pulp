module Pulp.System.Process
       ( commandName
       , argv
       , exit
       , stdin
       , stdout
       , stderr
       , getEnvironment
       , getPlatform
       , chdir
       , cwd
       ) where

import Prelude

import Control.Monad.Eff (Eff())

import Data.Array (drop, (!!))
import Data.Function
import Data.Maybe (fromMaybe)
import Data.Either (Either(..))
import Data.StrMap (StrMap())

import Pulp.System.FFI
import Pulp.System.Stream

foreign import argv' :: Array String

commandName :: String
commandName = fromMaybe "pulp" $ argv' !! 1

argv :: Array String
argv = drop 2 argv'

foreign import exit :: forall e a. Int -> EffN e a

foreign import stdin :: NodeStream String
foreign import stdout :: NodeStream String
foreign import stderr :: NodeStream String

-- | Gets a copy of the current environment
foreign import getEnvironment :: forall e. EffN e (StrMap String)

foreign import getPlatform :: forall e. EffN e String

foreign import chdir :: forall e. String -> EffN e Unit

foreign import cwd :: forall e. EffN e String