{ name = "my-project"
, dependencies = 
    [ "console"
    , "effect"
    , "halogen"
    , "prelude"
    , "aff"
    , "newtype"
    , "transformers"
    , "routing"
    , "maybe"
    , "routing-duplex"
    , "arrays"
    , "tuples"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
