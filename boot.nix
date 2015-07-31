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
      availableKernelModules = [ 
        "ohci_pci"
        "ehci_pci"
        "ahci"
        "firewire_ohci"
        "usb_storage"
        "usbhid"
      ];     
      kernelModules = [ 
        "fbcon"     # Text in the console, before login
        "kvm-intel" # Dunno...  
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
