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
    , "either"
    , "web-events"
    , "web-uievents"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
