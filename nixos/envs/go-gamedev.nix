with import <nixpkgs> {}; {
  goGamedevEnv = stdenv.mkDerivation {
    name = "go-gamedev";
    buildInputs = [ stdenv bash go xlibs.libX11 SDL2 SDL2_image SDL2_ttf SDL2_gfx SDL2_net pkgconfig ];

	shellHook = ''
		export GOROOT=${go}/share/go
		export GOPATH=/home/sheenobu/go-gamedev
		export PATH="$PATH:$GOPATH/bin"
	'';
  };
}
