{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Enable experimental features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Use the limine EFI boot loader.
  boot.loader.limine = {
    enable = true;
    maxGenerations = 3;
    style.wallpapers = [ ./walls/wall3.png ];
    style.wallpaperStyle = "stretched";
  };

  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Cairo"; 

  # Enable sound.  
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.adam = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video" "audio" "input" "storage" "seat" ]; # Enable ‘sudo’ for the user.
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

  # Enable PAM authentication for swaylock
  security.pam.services.swaylock = {};
  
  # Get MangoWM
  programs.mango.enable = true;
  
  # not use sudo for poweroff & reboot
  security.polkit.extraConfig = ''
  polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.login1.power-off" ||
         action.id == "org.freedesktop.login1.power-off-multiple-sessions" ||
         action.id == "org.freedesktop.login1.reboot" ||
         action.id == "org.freedesktop.login1.reboot-multiple-sessions") &&
        subject.isInGroup("wheel")) {
      return polkit.Result.YES;
    }
  });
'';

  # lemurs display manager
  services.displayManager.lemurs = {
    enable = true;
    settings = {
      background_color = "dark_gray";
      text_color = "white";
      username_field = {
        style = {
          title = "User:";
          title_color = "white";
          border_color = "white";
        };
      };
      password_field = {
        style = {
          title = "Password:";
          title_color = "white";
          border_color = "white";
        };
      };
      environment_switcher = {
        style = {
          title = "Session";
          title_color = "white";
          border_color = "white";
          selected_color = "white";
        };
      };
    };
  };

  # Enable Graphics Drivers
  hardware.graphics = {
     enable = true;
     enable32Bit = true;
  };

  # Environment variables
  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Ice";
    HYPRCURSOR_SIZE = "24";
  };

  # Enable XDG desktop portal
  xdg.portal.enable = true;

  # Disable nano editor
  programs.nano.enable = false;
  
  # List packages installed in system profile.
   environment.systemPackages = with pkgs; [
     vim 
     wget
     kitty
     rofi
     fastfetch
     btop
     yazi
     librewolf
     swaybg
     lavat
     tty-clock
     cmatrix
     cava
     wl-clipboard
     wlogout
     swayidle
     swaylock
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
     grim
     slurp
     inputs.mangobar.packages.${pkgs.stdenv.hostPlatform.system}.default
     pamixer
     brightnessctl
     lxappearance
     bibata-cursors
   ];

    system.stateVersion = "26.11"; 

}

