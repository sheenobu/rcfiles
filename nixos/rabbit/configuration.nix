{ config, pkgs, ... }:
let
    mednaffe = (pkgs.callPackage /etc/nixos/mednaffe.nix) {};
    r8168 = (pkgs.callPackage /etc/nixos/r8168.nix) {
       kernel = pkgs.linux_4_3;
    };
    linuxPkgs = pkgs.linuxPackages_4_3;
in
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/desktop.nix
    ];

  boot = {
    blacklistedKernelModules = [ "r8169" ];
    extraModulePackages = [ r8168 ];
    kernelPackages = linuxPkgs;
    kernelParams = [ "ipv6.disable=1" ]; # "pcie_aspm=off" ];
    loader.gummiboot.enable=true;
  };

  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };

  #virtualisation.virtualbox.host.enable = true;
  virtualisation.docker = {
    enable = true;
    extraOptions = "--dns 8.8.8.8";
  };

  networking = {
    hostName = "rabbit";
    networkmanager.enable = true;
    enableIPv6 = false;
  };

  i18n = {
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
  };

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
     arc-gtk-theme
     gtk-engine-murrine

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

     python35Packages.awscli

     # media
     #spotify
     steam
     libdvdread

     # emulation
     mednaffe
     #linuxPkgs.virtualbox
     wineUnstable

     # network media
     davfs2
  ];

  environment.variables.EDITOR = "nvim";
  environment.shellInit = ''
    alias vim=nvim
  '';

  nixpkgs.config.pulseaudio = true;
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
      displayManager.kdm.enable = false;
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

  users.groups.davfs2.name = "davfs2";

  # may not need a davfs2 user?
  users.extraUsers.davfs2 = {
    isNormalUser = false;
    uid = 1003;
  };

  users.extraUsers.sheenobu = {
     isNormalUser = true;
     uid = 1000;
     extraGroups = [
        "disk"
        "davfs2"
        "wheel"
        "video"
        "networkmanager"
        "docker"
        "audio"
     ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

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

  networking.extraHosts =
    ''
      192.168.1.42 lemur
      192.168.1.42 git.lemur
    '';

}
