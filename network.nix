# Networking

{ config, pkgs, ... }:

{
  networking = {
    hostName = "joshua";     # Define your hostname.
    hostId = "c43da070";
    wireless.enable = true;  # Enables wireless.
  };
}
