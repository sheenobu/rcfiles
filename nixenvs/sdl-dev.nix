with import <nixpkgs> {}; {
  sdlEnv = stdenv.mkDerivation {
    name = "sdl2";
    buildInputs = [ stdenv bash xlibs.libX11 SDL2 SDL2_image SDL2_ttf SDL2_gfx SDL2_net pkgconfig ];
  };
}
