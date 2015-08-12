# File:    users.nix
# Author:  Christian Kalhauge
# Date:    2015-07-31
# Description: |
#   Contains all information related to users.
{ config, pkgs, ... }:
{
  security.sudo.wheelNeedsPassword = false;

  users.extraGroups = {
    network = {};
  };
  
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  users.extraUsers.kalhauge = {
    isNormalUser = true;
    home = "/home/kalhauge";
    extraGroups = [ 
      "wheel"
      "network"
    ];
    shell = "/run/current-system/sw/bin/zsh";
    uid = 1000;
  };
}
