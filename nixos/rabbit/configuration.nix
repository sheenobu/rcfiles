{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./i3-gaps.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_4_2;
    loader.gummiboot.enable=true;
  };

  hardware  = {
    opengl.driSupport32Bit = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;  
    };
  };

  nixpkgs.config.pulseaudio = true;

  networking.hostName = "rabbit"; # Define your hostname.
  networking.networkmanager.enable = true;

  i18n = {
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
     # Core 
     wget
     vim
     tmux
     file
     binutils
 
     # desktop/libs
     gtk
   
     # browsers
     chromium
     firefox 

     # desktop utilities
     compton
     gnome3.nautilus

     # programming utilities
     ack
     autojump
     go 
     gcc
     git

     # media
     spotify 
     steam
  ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.chromium.enableWideVine = true; 
  nixpkgs.config.chromium.enablePepperFlash = true;

  services = {
    xserver = {
      enable = true;
      layout = "us";
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
