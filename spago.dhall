{ name = "markdown-it-halogen"
, dependencies =
  [ "console"
  , "dom-indexed"
  , "effect"
  , "halogen"
  , "html-parser-halogen"
  , "markdown-it"
  , "prelude"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
