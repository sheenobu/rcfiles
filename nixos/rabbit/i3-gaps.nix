# I3 DESKtop config
{ pkgs, ... }:
let
    hash = "1zr6r1n40p0n9p2g6fkxyhlzpd61bpd7xqilky063sh4gj4n4w9r";
    rev = "d7fd3c0";
    folder = "i3-${rev}";
in
{
  environment.systemPackages = with pkgs; [
    dmenu     # for app launcher
    feh       # for background image
    i3
    i3lock    # screen lock
    i3status  # sys info
    scrot     # for screenshot

    dunst     # for notifications
    libnotify # for notifications

    # xorg.utilmacros
    # xorg.xcursorgen
    # xorg.xcursorthemes
  ];

 nixpkgs.config.packageOverrides = pkgs: {
    i3 = pkgs.stdenv.lib.overrideDerivation pkgs.i3 (oldAttrs: rec {

        src = pkgs.fetchgit {
            url = "http://github.com/Airblader/i3.git";
            rev = rev;
            sha256 = hash;
        };

        # the i3 package is built for the main release and not the 'next' branch, so skip postInstall for now
        postInstall = ''

        '';

        # patch version since the makefile will fail to do this since there is no git in $PATH
        postUnpack = ''
            find .
            echo -n "4.10.2 (commit ${rev}, branch \\\"gaps-next\\\")" > ./${folder}/I3_VERSION
            echo -n "4.10.2" > ./${folder}/VERSION
        '';
        });
    };

  services.xserver = {
    windowManager = {
      i3.enable = true;
      default = "i3";
    };

    # displayManager = {
    #   sessionCommands = "i3status &";
    # };

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
  };
}

