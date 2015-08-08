# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./boot.nix
      ./users.nix
      ./xserver.nix
      ./network.nix
      ./filesystem.nix
    ];

  nixpkgs.config.allowUnfree = true;

  powerManagement = {
    enable = true;
    scsiLinkPolicy = "min_power";
  };
  
  #vList packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Utils 
    zsh
    fasd

    # Utils
    htop
    wget

    # Fonts
    terminus_font
    inconsolata

    # Develop
    vim_configurable
    git

    # Code
    python27
    python34
    ghc.ghc783
    
    # X11 
    xclip
    termite
    xcb-util-cursor
  ]; 

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;
}
