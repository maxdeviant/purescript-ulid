module Test.Main where

import Prelude
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Class.Console (logShow)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)
import Ulid (parseUlid, toString, ulid)

main :: Effect Unit
main = do
  launchAff_
    $ runSpec [ consoleReporter ] do
        describe "Ulid.ulid" do
          it "returns a ULID" do
            actual <- liftEffect ulid
            logShow actual
        describe "Ulid.parseUlid" do
          it "parses a valid ULID" do
            expected <- liftEffect ulid
            let
              actual = parseUlid $ toString expected
            actual `shouldEqual` Just expected
          it "returns `Nothing` when given an empty string" do
            let
              actual = parseUlid ""
            actual `shouldEqual` Nothing
          it "returns `Nothing` when given a garbage string" do
            let
              actual = parseUlid "Hello, world!"
            actual `shouldEqual` Nothing
          it "returns `Nothing` when given a timestamp that is too high" do
            let
              actual = parseUlid "80000000000000000000000000"
            actual `shouldEqual` Nothing
