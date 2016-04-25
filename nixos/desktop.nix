# Desktop config that isn't hardware specific
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
    compton      # for compositor
    xsel         # for cli copy/paste
    lxappearance # for theming changes
    baobab       # for filesystem visualization

    # filesystem
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-dropbox-plugin
    xfce.thunar_volman

    # utils
    xorg.xbacklight
    xorg.xwininfo

    # theming
    gtk
    arc-gtk-theme
    gtk-engine-murrine

    # browsing
    chromium
    firefox
  ];

  # audio support
  nixpkgs.config.pulseaudio = true;

  # flash support and encryption support
  nixpkgs.config.chromium.enableWideVine = true;
  nixpkgs.config.chromium.enablePepperFlash = true;

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager = {
      lightdm.enable = true;
    };

    windowManager = {
      bspwm.enable = true;
      default = "bspwm";
    };

    desktopManager = {
      xterm.enable = false;
    };
  };

  fonts = {
    fontconfig.enable = true;
    enableCoreFonts = true;
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      corefonts  # Micrsoft free fonts
      inconsolata  # monospaced
      ubuntu_font_family  # Ubuntu fonts
      unifont # some international languages
    ];
  };

}

