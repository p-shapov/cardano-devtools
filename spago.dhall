{ name = "my-project"
, dependencies = 
    [ "console"
    , "css"
    , "effect"
    , "halogen"
    , "prelude"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
