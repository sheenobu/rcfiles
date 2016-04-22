# Desktop Config
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    dmenu     # for app launcher
    feh       # for background image
    scrot     # for screenshot
    libnotify # for notifications
    tint2     # for taskbar, applet bar
	conky     # for system status 

    # xorg.utilmacros
    # xorg.xcursorgen
    # xorg.xcursorthemes
  ];

  services.xserver = {
    windowManager = {
      bspwm.enable = true;
      default = "bspwm";
    };

    desktopManager = {
      xterm.enable = false;
    };
  };
}

