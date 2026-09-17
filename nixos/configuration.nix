{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Enable experimentsl features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the limine EFI boot loader.
  boot.loader.limine = {
    enable = true;
    maxGenerations = 3;
    style.wallpapers = [ ./walls/wall2.png ];
    style.wallpaperStyle = "centered";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    windowManager.bspwm.enable = true;
    displayManager.lightdm.enable = false;
    displayManager.startx.enable = true;
  };  

  # Enable sound.  
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    wireplumber.enable = true;
    alsa.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.adam = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "audio" "input" "storage" ]; # Enable ‘sudo’ for the user.
     shell = pkgs.fish;
     packages = with pkgs; [
       tree
     ];
   };

   users.users.root = {
     shell = pkgs.fish;
   };

  # Get Fish Shell
  programs.fish.enable = true;

  # Get New Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  
  # List packages installed in system profile.
   environment.systemPackages = with pkgs; [
     vim 
     wget
     kitty
     sxhkd
     rofi
     polybar
     fastfetch
     btop
     yazi
     neovim
     picom-pijulius
     librewolf
     feh
     lavat
     tty-clock
     cmatrix
     cava
     xset
     xclip
     python3
     ruff
     pyright
     fd
     ripgrep
     fzf 
     imagemagick
     github-cli
     git
     curl
     scrot
   ];

    system.stateVersion = "26.11"; 

}

