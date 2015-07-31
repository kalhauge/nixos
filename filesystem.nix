# Filesystem
{ config, pkgs, ... }:

{
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/2d4c03ba-d680-4a2f-8b33-8ea6341d96f9";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/B1F4-8842";
      fsType = "vfat";
    };
  
  fileSystems."/deep" = 
    { device = "/dev/disk/by-uuid/88133225-1629-4cce-9b34-1c0fd9560b08";
      fsType = "ext4";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/05d92d0d-b97f-4dd6-9e5e-8aa1822caae7"; }
    ];
}
