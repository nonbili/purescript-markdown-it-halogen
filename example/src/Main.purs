module Main where

import Prelude
import Effect (Effect)
import Halogen.Aff as HA
import Halogen.VDom.Driver (runUI)
import App (app)

main :: Effect Unit
main = HA.runHalogenAff do
  body <- HA.awaitBody
  runUI app unit body
