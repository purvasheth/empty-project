module Main where

import AESClient
import AESClient qualified
import AESServer
import Data.ByteString.Char8 qualified as C
import Data.Map qualified
import System.Environment
import TestAES
import Utils

main :: IO ()
main = do
  args <- getArgs
  case args of
    ["server"] -> AESServer.aesServer 5520
    ["client", key] -> AESClient.startClient "5520" (C.pack key)
    ["test"] -> do 
      TestAES.tests
      Utils.utilTests
    _ -> putStrLn "unknown command"
