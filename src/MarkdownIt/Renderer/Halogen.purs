module MarkdownIt.Renderer.Halogen
  ( renderString
  , render
  ) where

import Prelude

import Effect.Unsafe (unsafePerformEffect)
import Halogen.HTML as HH
import Html.Parser.Halogen as PH
import MarkdownIt as MD

-- | Render markdown string into Halogen HTML.
renderString :: forall p i. String -> HH.HTML p i
renderString input =
  PH.render $ unsafePerformEffect $ MD.renderString input

-- | Use an existing MarkdownIt instance to render markdown string into Halogen
-- | HTML.
render :: forall p i. MD.MarkdownIt -> String -> HH.HTML p i
render md input =
  PH.render $ unsafePerformEffect $ MD.render input md
