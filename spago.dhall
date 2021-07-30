{ name = "ulid"
, license = "MIT"
, repository = "https://github.com/maxdeviant/purescript-ulid"
, dependencies =
  [ "aff"
  , "console"
  , "effect"
  , "functions"
  , "maybe"
  , "nullable"
  , "prelude"
  , "psci-support"
  , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
