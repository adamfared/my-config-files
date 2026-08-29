{ modules, config, pkgs, lib, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      modules.mango
      modules.pipewire
      modules.wireplumber
    ];

  # Use 6.18 kernel.
  boot.kernelPackages = pkgs.linuxPackages_6_18;

  finit.runlevel = 3;

  finit.services.nix-daemon = {
    environment.CURL_CA_BUNDLE = config.security.pki.caBundle;
  };

  services.nix-daemon = {
    enable = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

  boot.loader.efi.canTouchEfiVariables = true;

  programs = {
    limine = {
      enable = true;
      settings.wallpaper = [ "/home/adam/walls/wall1.png" ];
      maxGenerations = 3;
      settings.editor_enabled = true; # Disable on systems that need security
    };

    sudo.enable = true;

    bash.enable = true;
  };

  services = {
    polkit.enable = true;

    sysklogd.enable = true;

    dbus.enable = true;

    mdevd.enable = true;
    
    seatd.enable = true;

    dhcpcd.enable = true;

    iwd.enable = true;
 };

  networking.hostName = "finix"; # Define your hostname.

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.adam = {
    isNormalUser = true;
    description = "test user";
    shell = pkgs.fish;
    extraGroups = [ "wheel" "seat" "video" "audio" "input" "storage" ];
    passwordFile = "/home/adam/.config/finixos/password.hash";
    packages = with pkgs; [];
  };
    
  users.users.root = {
    passwordFile = "/home/adam/.config/finixos/password.hash";
    shell = lib.mkForce pkgs.fish;
  };
  
  # Enable MangoWM
  programs.mango.enable = true;
   
  # Graphics Driver
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  
  # Enable FontConfig
  fonts.fontconfig.enable = true;

  # Get new fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ]; 

  # Audio
  programs.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };
  
  programs.wireplumber = {
    enable = true;
  };
 
  # Enable XDG desktop portal
  xdg.portal.enable = true;

  # List packages installed in system profile. 
  environment.systemPackages = with pkgs; [
    vim-full
    wget
    git
    nixos-rebuild-ng
    iputils
    iproute2
    kitty
    fish
    librewolf 
    xdg-desktop-portal-wlr
    rofi
    swaybg
    fastfetch
    btop
    grim
    slurp
    yazi
    wl-clipboard
    cliphist
    waybar
    nwg-look
    vscodium.fhs
    python3
    mako
    cava
    cmatrix
    tty-clock
    lavat
    github-cli
  ];
}
