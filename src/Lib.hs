{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Data.Aeson
import GHC.Generics

type ScriptName = String
type ScriptCommand = String

type Script = (ScriptName, ScriptCommand)

data Package = Package { 
    name :: String,
    scripts :: String
} deriving (Show, Generic)

instance FromJSON Package
-- instance ToJSON Package

str = "{\"name\": \"test-package\",\"scripts\": {\"go:native\": \"yarn build:native && yarn start:native\",\"start\": \"./lib/bs/bytecode/indexhot.byte\"}}"

filePath = "data/package.json"

someFunc :: IO ()
someFunc = putStrLn "poo"
--someFunc = print $ displayMaybe maybe where
--    jsonStr <- readFile filePath
--    package  fileToString jsonStr
--    print $ displayMaybe package

displayMaybe :: (Show a) => Maybe a -> String
displayMaybe (Just a) = show a
displayMaybe _ = "--Nope--"
    
fileToString :: String -> Maybe Package
fileToString jsonStr = decode str

