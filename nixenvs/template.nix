with import <nixpkgs> {}; {
  myEnv = stdenv.mkDerivation {
    name = "my-env";
    buildInputs = [ ];

	shellHook = ''

	'';
  };
}
