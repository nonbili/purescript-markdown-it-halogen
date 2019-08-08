module App where

import Prelude

import Data.Const (Const)
import Data.Maybe (Maybe(..))
import Data.Options ((:=))
import Effect.Unsafe (unsafePerformEffect)
import Halogen as H
import Halogen.HTML as HH
import Halogen.HTML.Events as HE
import Halogen.HTML.Properties as HP
import MarkdownIt as MD
import MarkdownIt.Renderer.Halogen as MRH

type Query = Const Void

data Action = OnValueChange String

type State =
  { markdownIt :: MD.MarkdownIt
  , value :: String
  }

initValue :: String
initValue = """
# Markdown in Halogen

Powered by [purescript-markdown-it](https://github.com/nonbili/purescript-markdown-it) and [purescript-html-parser-halogen](https://github.com/rnons/purescript-html-parser-halogen).
"""

initialState :: State
initialState =
  { markdownIt
  , value: initValue
  }
  where
  markdownIt = unsafePerformEffect $
    MD.newMarkdownIt MD.Default $ MD.linkify := true

class_ :: forall r i. String -> HP.IProp ("class" :: String | r) i
class_ = HP.class_ <<< HH.ClassName

style :: forall r i. String -> HP.IProp ("style" :: String | r) i
style = HP.attr (HH.AttrName "style")

render :: forall m. State -> H.ComponentHTML Action () m
render state =
  HH.div [ class_ "grid" ]
  [ HH.h2 [ class_ "header" ]
    [ HH.text "purescript-markdown-it-halogen example" ]
  , HH.div [ class_ "col col-edit" ]
    [ HH.h4_ [ HH.text "EDIT" ]
    , HH.textarea
      [ class_ "edit"
      , HP.value state.value
      , HE.onValueInput $ Just <<< OnValueChange
      ]
    ]
  , HH.div [ class_ "col col-preview" ]
    [ HH.h4_ [ HH.text "PREVIEW" ]
    , HH.div [ class_ "preview" ]
      [ MRH.render_ state.markdownIt state.value ]
    ]
  , HH.div [ class_ "footer" ]
    [ MRH.renderString "[source code](https://github.com/nonbili/purescript-markdown-it/halogen/tree/master/example)"
    ]
  ]
  where
  repoUrl = "https://github.com/rnons/purescript-html-parser-halogen"
  demoSourceUrl = repoUrl <> "/tree/master/example"

app :: forall m. H.Component HH.HTML Query Unit Void m
app = H.mkComponent
  { initialState: const initialState
  , render
  , eval: H.mkEval $ H.defaultEval
      { handleAction = handleAction }
  }

handleAction :: forall m. Action -> H.HalogenM State Action () Void m Unit
handleAction = case _ of
  OnValueChange value -> do
    H.modify_ $ _ { value = value }
