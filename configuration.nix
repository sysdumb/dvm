{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "sys"; 
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "/";

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };


  environment.systemPackages = with pkgs; [
    vim_configurable
    git
    wget
    # firefox
  ];

  console.useXkbConfig = true;
  services.xserver = {
    # enable = true;
    # desktopManager.plasma5.enable = true;
    xkbOptions = "ctrl:swapcaps";
  };

  # List services that you want to enable:

  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "22.05";

}
