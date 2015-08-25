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

  services.ntp.enable = true;

  time.timeZone = "Europe/Copenhagen";

  powerManagement = {
    enable = true;
    scsiLinkPolicy = "min_power";
  };

  programs.zsh.enable = true;
  
  #vList packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    # Utils 
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
    tmux

    # Code
    python27
    python34
    
    # X11 
    xclip
    termite
    xcb-util-cursor
  ]; 

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable Transmission 
  services.transmission = {
    enable = true;
    settings = {
      download-dir = "/deep/Download";
      incomplete-dir = "/deep/Download/.incomplete";
      incomplete-dir-enabled = true;
      watch-dir = "/home/kalhauge/Downloads";
      watch-dir-enabled = true;
      ratio-limit-enabled = true;
      ratio-limit = 2;
      encryption = 2;
      umask = 2;
    };
  };
  # Enable CUPS to print documents.
  services.printing.enable = true;
}
