
# enters a shell with the given package file (non-built)
function nix-pkg-shell()  {
  nix-shell --show-trace -E "
    with import <nixpkgs> {}; { 
      x = ((pkgs.callPackage $1) {})
    }"
}

# builds the package file and enters a shell with the package
function nix-build-pkg-shell()  {
  nix-shell --show-trace -E "
    with import <nixpkgs> {}; { 
        e = stdenv.mkDerivation { 
          name = \"$1\";
          buildInputs = [ 
            ((pkgs.callPackage $2) {})
          ];
        };
    }"
}
