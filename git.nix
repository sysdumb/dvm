{ pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "gitUsername";
    userEmail = "gitEmail";
  };
}
