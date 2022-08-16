let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20220808/packages.dhall
        sha256:60eee64b04ca0013fae3e02a69fc3b176105c6baa2f31865c67cd5f881a412fd

in  upstream
with
    markdown-it =
        { dependencies =
            [ "effect"
            , "prelude"
            , "psci-support"
            , "foldable-traversable"
            , "foreign"
            , "tuples"
            , "jest"
            , "node-process"
            , "options"
            ]
        , repo = "https://github.com/nonbili/purescript-markdown-it.git"
        , version = "f6e8ee91298f2fc13c4277e75a19e0538de5f7a2"
        }
with
    html-parser-halogen =
        { dependencies =
            [ "arrays"
            , "control"
            , "dom-indexed"
            , "foldable-traversable"
            , "effect"
            , "halogen"
            , "maybe"
            , "prelude"
            , "psci-support"
            , "jest"
            ]
        , repo = "https://github.com/rnons/purescript-html-parser-halogen.git"
        , version = "035a51d02ba9f8b70c3ffd9fe31a3f5bed19941c"
        }
with
    jest =     
        { dependencies = [ "effect", "aff", "aff-promise" ]
        , repo = "https://github.com/nonbili/purescript-jest.git"
        , version = "v1.0.0"
        }
