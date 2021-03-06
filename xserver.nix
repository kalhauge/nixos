# X server config

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager = {
      desktopManagerHandlesLidAndPower = true;
      auto = {
        enable = true;
        user = "kalhauge";
      };
    };
    videoDrivers = [ "nvidiaLegacy340" ];
    
    synaptics = {
      enable = false; 
      # Change Scroll to feel natural
      horizontalScroll = true;
      twoFingerScroll = true;
    };

    multitouch = {
      enable = true;
      ignorePalm = true;
      invertScroll = true; 
    };

    desktopManager.xterm.enable = false;
   
    # remember to activate packages
    windowManager = {
      default = "xmonad";
      xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };
  };
  
  hardware.opengl = { 
    # videoDrivers = [ "nvideaLegacy340" ];
    driSupport32Bit = true;
  };

  environment.systemPackages = with pkgs; [
    # Xmonad
    haskellPackages.xmobar
    #haskellPackages.xmonad
    # haskellPackages.xmonadContrib
    # haskellPackages.xmonadExtras
  ];

  # Setup fonts
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      ubuntu_font_family
      dejavu_fonts
      terminus_font
      inconsolata # Does not work
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [
          "Terminus"
        ];
      };
    };
  };
}

