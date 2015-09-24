# Networking

{ config, pkgs, ... }:

{
  networking = {
    hostName = "joshua";     # Define your hostname.
    hostId = "c43da070";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 80 443 8080 ];
    }; 
    enableB43Firmware = true;
    wireless = {
      enable = true;  # Enables wireless.
      interfaces = [ "wlan0" ]; # Sadly it's needed
      userControlled = {
        enable = true;
        group = "network";
      };
    };
  };
}
