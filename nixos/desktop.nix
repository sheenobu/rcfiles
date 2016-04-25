# Desktop Config
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    rofi         # for app launcher
    feh          # for background image
    scrot        # for screenshot
    libnotify    # for notifications
    tint2        # for taskbar, applet bar
    conky        # for system status
    xscreensaver # for desktop locking
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

