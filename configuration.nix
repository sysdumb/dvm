{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  users.users.admin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    vim_configurable git
    wget
  ];

  console.useXkbConfig = true;
  services.xserver.xkbOptions = "ctrl:swapcaps";

  # List services that you want to enable:

  services.openssh.enable = true;

  system.stateVersion = "22.05";
}
