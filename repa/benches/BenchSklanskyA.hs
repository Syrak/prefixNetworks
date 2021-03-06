module Main where

import Scans
import Data.Array.Repa
import Data.Array.Repa.Index (ix1)

--import Data.List

import Criterion.Main
import System.Random

import Data.Functor.Identity

import Control.Exception

main = do
  check
  defaultMain
    [ bench "SklanskyA" $ whnf compute ua
    , bench "List"     $ nf (scanl1 op) rand
    ]
  where compute = runIdentity . sklanskyA op
        check | correct   = return ()
              | otherwise = throwIO $ AssertionFailed "Incorrect implementation"
        correct = compute ua `equalsS` fromListUnboxed (ix1 n) (scanl1 op rand)
        op = (+)
        n = 32000 :: Int
        ua = fromListUnboxed (ix1 n) $ rand
        rand = randomInts n

randomInts :: Int -> [Int]
randomInts n = take n $ randoms $ mkStdGen 1337
