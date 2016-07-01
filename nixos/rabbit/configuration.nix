{ config, pkgs, lib, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/desktop.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      bluez = pkgs.bluez5;
      inherit (import /etc/sheenobu-nixpkgs { inherit pkgs lib; }) sheenobupkgs;
    };
  };

  boot = {
    blacklistedKernelModules = [ "r8169" ];
    extraModulePackages = [
      (pkgs.sheenobupkgs.r8168 { kernel = pkgs.linux; })
    ];
    kernelPackages = pkgs.linuxPackages;
    kernelParams = [ "ipv6.disable=1" ]; # "pcie_aspm=off" ];
    loader.gummiboot.enable=true;
  };

  hardware = {
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
    bluetooth = {
      enable = true;
    };
  };

  virtualisation.virtualbox.host.enable = true;
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

     # programming utilities
     ack
     autojump
     gcc
     git
     python35Packages.awscli
     sheenobupkgs.vscode

     # media
     #spotify
     steam
     libdvdread

     # emulation
     sheenobupkgs.mednaffe
     wineUnstable

     # network media
     davfs2
  ];

  environment.variables.EDITOR = "nvim";
  environment.shellInit = ''
    alias vim=nvim
  '';
  services = {
    clamav = {
      updater.enable = true;
    };
    xserver = {
      videoDrivers = [ "nvidia" ];
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
        "vboxusers"
     ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.03";

  fonts.fontconfig.dpi = 120;

  networking.extraHosts =
    ''
      192.168.1.42 lemur
      192.168.1.42 git.lemur
    '';

}
