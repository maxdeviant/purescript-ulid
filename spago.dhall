{ name = "ulid"
, license = "MIT"
, repository = "https://github.com/maxdeviant/purescript-ulid"
, dependencies = [ "console", "effect", "nullable", "psci-support", "spec" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
