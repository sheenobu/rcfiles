{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./i3-gaps.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_4_3;
    loader.gummiboot.enable=true;
    kernelParams = [ "ipv6.disable=1" "pcie_aspm=off" ];
  };

  hardware  = {
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.extraOptions = "--dns 8.8.8.8";

  nixpkgs.config.pulseaudio = true;

  networking.hostName = "rabbit"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;

  i18n = {
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
     # Core
     wget
     neovim
     tmux
     file
     binutils
     unrar
     autojump
     file
     mercurial
     socat
     dropbox-cli

     xorg.xbacklight
     xorg.xwininfo

     # desktop/libs
     gtk

     # browsers
     chromium
     firefox

     # desktop utilities
     compton
     gnome3.nautilus
     xsel
     baobab

     # programming utilities
     ack
     autojump
     go
     gcc
     git

     # media
     #spotify
     steam
     wineUnstable
  ];

  environment.variables.EDITOR = "nvim";

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.chromium.enableWideVine = true;
  nixpkgs.config.chromium.enablePepperFlash = true;

  services = {
    clamav = {
      updater.enable = true;
    };
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "nvidia" ];
      displayManager.lightdm.enable = true;
      displayManager.slim.enable = false;
      synaptics = {
        enable = true;

        # http://who-t.blogspot.fr/2010/11/how-to-ignore-configuration-errors.html
        dev = "/dev/input/event*";
        twoFingerScroll = true;
        accelFactor = "0.001";
        buttonsMap = [ 1 3 2 ];
      };
    };
  };

  users.extraUsers.sheenobu = {
     isNormalUser = true;
     uid = 1000;
     extraGroups = [
        "wheel"
        "video"
        "networkmanager"
        "docker"
        "audio"
     ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

  fonts = {
     fontconfig = {
        dpi = 120;
        enable = true;
     };
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
