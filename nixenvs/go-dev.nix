with import <nixpkgs> {}; {
  goEnv = stdenv.mkDerivation {
    name = "go-1.6-main";
    buildInputs = [ stdenv bash go_1_6 ];

	shellHook = ''
		export GOROOT=${go_1_6}/share/go
		export GOPATH=/home/sheenobu/go-paths/go-main
		export PATH="$PATH:$GOPATH/bin"
	'';
  };
}
