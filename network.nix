# Networking

{ config, pkgs, ... }:

{
  networking = {
    hostName = "joshua";     # Define your hostname.
    hostId = "c43da070";
    wireless.enable = true;  # Enables wireless.
  };

  # Workaround for Broadcom drivers required to v. 3.18
  # Remember to set nixpkgs.config.allowUnfree = true

  boot = {
    initrd.kernelModules = [ "wl" ];
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
  }

}
