module MarkdownIt.Renderer.Halogen
  ( renderString
  ) where

import Prelude

import Effect.Unsafe (unsafePerformEffect)
import Halogen.HTML as HH
import Html.Parser.Halogen as PH
import MarkdownIt as MD

renderString :: forall p i. String -> HH.HTML p i
renderString input =
  PH.render $ unsafePerformEffect $ MD.renderString input
