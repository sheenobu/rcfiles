with import <nixpkgs> {}; {
  goEnv = stdenv.mkDerivation {
    name = "go-";
    buildInputs = [ stdenv bash go ];

	shellHook = ''
		export GOROOT=${go}/share/go
		export GOPATH=/home/sheenobu/go-paths/
		export PATH="$PATH:$GOPATH/bin"
	'';
  };
}
