{ name = "my-project"
, dependencies = 
    [ "console"
    , "css"
    , "effect"
    , "halogen"
    , "halogen-css"
    , "prelude"
    , "aff"
    , "newtype"
    , "transformers"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
