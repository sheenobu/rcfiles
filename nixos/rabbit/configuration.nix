{ config, pkgs, lib, ... }:
let

    # backport to 16.03, for makeSearchPathOutput
    getOutput = output: pkg:
      if pkg.outputUnspecified or false
        then pkg.${output} or pkg.out or pkg
        else pkg;

    # backport to 16.03
    makeSearchPathOutput = output: subDir: pkgs: lib.makeSearchPath subDir (map (getOutput output) pkgs);

    # backport to 16.03
    mednaffe = (pkgs.callPackage /etc/nixos/mednaffe.nix) {};

    # not accepted yet
    r8168 = (pkgs.callPackage /etc/nixos/r8168/r8168.nix) {
       kernel = pkgs.linux;
    };

    # backport to 16.03
    atomEnv = (pkgs.callPackage /etc/nixos/atom-env.nix) {
      gconf = pkgs.gnome.GConf;
      makeSearchPathOutput = makeSearchPathOutput;
    };

    # backport to 16.03
    vscode = (pkgs.callPackage /etc/nixos/vscode.nix) {
	atomEnv = atomEnv;
    };

    linuxPkgs = pkgs.linuxPackages;
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
     go
     gcc
     git
     python35Packages.awscli
     vscode

     # media
     #spotify
     steam
     libdvdread

     # emulation
     mednaffe
     linuxPkgs.virtualbox
     wineUnstable

     # network media
     davfs2
  ];

  environment.variables.EDITOR = "nvim";
  environment.shellInit = ''
    alias vim=nvim
  '';

  nixpkgs.config.allowUnfree = true;

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
