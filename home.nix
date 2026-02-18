{ pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./programs.nix
    ./podman.nix
    ./k3s.nix
  ];

  home.username = "gingdev";
  home.homeDirectory = "/home/gingdev";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nano";
    PHP_CLI_SERVER_WORKERS = "8";
  };

  services.podman = {
    enable = false;
    package = pkgs.podman;
  };

  services.k3s.enable = false;
}
