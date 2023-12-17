module Main (main) where

import Control.Parallel.Strategies
import System.TimeIt

f :: Double -> Double
f x = x

parallelIntegral :: (Double -> Double) -> Double -> Double -> Int -> Double
parallelIntegral func a b numIntervals =
  let dx = (b - a) / fromIntegral numIntervals
      intervalRanges = [(a + fromIntegral i * dx, a + fromIntegral (i + 1) * dx) | i <- [0..numIntervals-1]]
      partialIntegrals = parMap rdeepseq (\(start, end) -> integrateInterval func start end dx) intervalRanges
  in dx * fromIntegral numIntervals * sum partialIntegrals 


nonParallelIntegral :: (Double -> Double) -> Double -> Double -> Int -> Double
nonParallelIntegral func a b numIntervals =
  let dx = (b - a) / fromIntegral numIntervals
      intervalRanges = [(a + fromIntegral i * dx, a + fromIntegral (i + 1) * dx) | i <- [0..numIntervals-1]]
      partialIntegrals = map (\(start, end) -> integrateInterval func start end dx) intervalRanges
  in dx * fromIntegral numIntervals * sum partialIntegrals
  

integrateInterval :: (Double -> Double) -> Double -> Double -> Double -> Double
integrateInterval func start end dx = (func start + func end) * dx / 2


nonpar :: IO ()
nonpar = do
  let a = 0.0
      b = 1.0
      numIntervals = 1000000

  let result2 = nonParallelIntegral f a b numIntervals
  putStrLn $ "Result nonpar: " ++ show result2


par :: IO()
par = do 
  let a = 0.0
      b = 1.0
      numIntervals = 1000000

  let result1 = parallelIntegral f a b numIntervals
  putStrLn $ "Result par: " ++ show result1


main :: IO()
main = do
  timeIt $ do
    par

  timeIt $ do
    nonpar