{ name = "my-project"
, dependencies = 
    [ "console"
    , "css"
    , "effect"
    , "halogen"
    , "halogen-css"
    , "prelude"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
