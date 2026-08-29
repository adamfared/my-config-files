{ config, lib, pkgs, modulesPath, ... }:

{

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" "sr_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
 
  hardware.firmware = [ pkgs.linux-firmware ];

  fileSystems."/" =
    { device = "/dev/sda3";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/sda1";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices =
    [ { device = "/dev/sda2"; }
    ];

}
