# X server config

{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  services.xserver.windowManager.xmonad = true;
  
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.auto = {
      enable = true;
      user = "kalhauge";
    };
    videoDrivers = [ "nvidia" ];
    synaptics.enable = true; 
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
  
  hardware.opengl.driSupport32Bit = true;

  environment.systemPackages = with pkgs; [
    # Xmonad
    haskellPackages.xmobar
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras
  ]

  # Setup fonts
  fonts = {
    fonts =  with pkgs; [
      dejavu_fonts
      terminus_font
      # incosolata -- Does not work
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

