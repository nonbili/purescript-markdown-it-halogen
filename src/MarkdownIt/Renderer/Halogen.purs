module MarkdownIt.Renderer.Halogen
  ( renderString
  , render_
  , render
  ) where

import Prelude

import DOM.HTML.Indexed (HTMLdiv)
import Effect.Unsafe (unsafePerformEffect)
import Halogen.HTML as HH
import Html.Renderer.Halogen as RH
import MarkdownIt as MD

-- | Render markdown string into Halogen HTML.
renderString :: forall p i. String -> HH.HTML p i
renderString input =
  RH.render_ $ unsafePerformEffect $ MD.renderString input

-- | Use an existing MarkdownIt instance to render markdown string into Halogen
-- | HTML.
render_ :: forall p i. MD.MarkdownIt -> String -> HH.HTML p i
render_ md input = render md [] input

-- | Use an existing MarkdownIt instance to render markdown string into Halogen
-- | HTML.
render
  :: forall p i
   . MD.MarkdownIt
  -> Array (HH.IProp HTMLdiv i)
  -> String
  -> HH.HTML p i
render md props input =
  RH.render props $ unsafePerformEffect $ MD.render md input
