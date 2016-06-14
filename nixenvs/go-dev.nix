with import <nixpkgs> {}; {
  goEnv = stdenv.mkDerivation {
    name = "go-main";
    buildInputs = [ stdenv bash go ];

	shellHook = ''
		export GOROOT=${go}/share/go
		export GOPATH=/home/sheenobu/go-paths/go-main
		export PATH="$PATH:$GOPATH/bin"
	'';
  };
}
