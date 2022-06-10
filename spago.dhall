{ name = "my-project"
, dependencies = 
    [ "console"
    , "effect"
    , "halogen"
    , "prelude"
    , "aff"
    , "newtype"
    , "transformers"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
