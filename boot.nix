# File:    boot.nix
# Author:  Christian Kalhauge
# Date:    2015-07-31
# Description: |
#   Contains all information related to boot.
{ config, pkgs, ... }:
{

  boot = {

    # Gummiboot loader required with EFI boot
    # PROTIP: hold space when booting to see menu and old system versions
    loader.gummiboot.enable = true;

    initrd = { 
      
      kernelModules = [ 
        "fbcon"     # Text in the console, before login
        "kvm-intel" # Dunno...  
        "wl"        # Broadcom drivers required to v. 3.18
      ]; 
      
      # Cryptation LVM on LUKS
      luks.devices = [ 
        { name = "rootfs"; 
          device = "/dev/sda5";
          preLVM = true;
        }
      ];
    };
  };

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

}
