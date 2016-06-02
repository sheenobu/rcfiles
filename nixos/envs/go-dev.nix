with import <nixpkgs> {}; {
  goEnv = stdenv.mkDerivation {
    name = "go-env";
    buildInputs = [ stdenv bash go ];

	shellHook = ''
		export GOROOT=${go}/share/go
		export GOPATH=/home/sheenobu/go
		export PATH="$PATH:$GOPATH/bin"
	'';
  };
}
