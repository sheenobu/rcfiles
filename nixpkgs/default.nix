{ pkgs ? (import <nixpkgs> {}), lib }:

let

  # backport to 16.03, for makeSearchPathOutput
  getOutput = output: pkg:
    if pkg.outputUnspecified or false
      then pkg.${output} or pkg.out or pkg
      else pkg;

  # backport to 16.03
  makeSearchPathOutput = output: subDir: pkgs: lib.makeSearchPath subDir (map (getOutput output) pkgs);

  # let's define our own callPackage to avoid typing all dependencies
  callPackage = pkgs.lib.callPackageWith (pkgs // sheenobupkgs);

  # our custom packages
  sheenobupkgs = rec {

    # backport to 16.03
    mednaffe = (pkgs.callPackage ./mednaffe) {};

    # backport to 16.03
    atomEnv = (pkgs.callPackage ./vscode/atom-env.nix) {
      gconf = pkgs.gnome.GConf;
      makeSearchPathOutput = makeSearchPathOutput;
    };

    # backport to 16.03
    vscode = (pkgs.callPackage ./vscode) {
	  atomEnv = atomEnv;
    };

    r8168 = (pkgs.callPackage ./r8168/r8168.nix);

  };
in pkgs // {
  inherit sheenobupkgs;
}
