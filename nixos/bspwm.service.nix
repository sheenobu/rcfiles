{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.xserver.windowManager.bspwm_patched;
  bspwm_patched = (pkgs.callPackage /etc/nixos/bspwm.nix) {};
in

{
  options = {
    services.xserver.windowManager.bspwm_patched.enable = mkEnableOption "bspwm_patched";
  };

  config = mkIf cfg.enable {
    services.xserver.windowManager.session = singleton {
      name = "bspwm_patched";
      start = "
        ${pkgs.sxhkd}/bin/sxhkd &
        ${bspwm_patched}/bin/bspwm
      ";
    };
    environment.systemPackages = [ bspwm_patched ];
  };
}
