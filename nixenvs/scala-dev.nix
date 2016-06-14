with import <nixpkgs> {}; {
  scalaEnv = stdenv.mkDerivation {
    name = "scala-dev";
    buildInputs = [ stdenv scala sbt maven ];
  };
}
