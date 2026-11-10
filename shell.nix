with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "purescript-ulid";

  buildInputs = [
    nodejs_22
    yarn
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin:$PATH"
  '';
}
