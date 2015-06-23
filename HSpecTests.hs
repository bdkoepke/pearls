module Main where

import MinFree
import Test.Hspec

main :: IO ()
main = hspec minfreeTest

minfreeTest :: Spec
minfreeTest = do
  describe "Validate minfree function" $
    it "minfree should find the smallest number not in the supplied set" $
      minfree [08, 23, 09, 00, 12, 11, 01, 10, 31, 07, 41, 04, 14, 21, 05, 17, 03, 19, 02, 06] `shouldBe` 13

  describe "Validate minfree' function" $
    it "minfree' should find the smallest number not in the supplied set" $
      minfree' [08, 23, 09, 00, 12, 11, 01, 10, 31, 07, 41, 04, 14, 21, 05, 17, 03, 19, 02, 06] `shouldBe` 13
