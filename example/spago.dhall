{ name = "example"
, dependencies =
  [ "const"
  , "dom-indexed"
  , "effect"
  , "halogen"
  , "html-parser-halogen"
  , "markdown-it"
  , "options"
  , "prelude"
  ]
, packages = ./packages.dhall
, sources = [ "../src/**/*.purs", "src/**/*.purs" ]
}
