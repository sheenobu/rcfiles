# I3 DESKtop config
{ pkgs, ... }:

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
            rev = "refs/heads/gaps-next";
            sha256 = "03kmb0zj4lv90v680gnf4zhrn31ydmmmsj1hw69chm6kg4k3n729";
        };


        # the i3 package is built for the main release and not the 'next' branch 
        postInstall = ''

        '';

        postUnpack = ''
            find .
            echo -n "4.10.2 (2015-07-14, branch \\\"gaps-next\\\")" > ./i3/I3_VERSION
            echo -n "4.10.2" > ./i3/VERSION
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

