{ pkgs, ... }:
{
  imports = [
    ./packages.nix
    ./programs.nix
    ./services.nix
    ./k3s.nix
  ];

  home.username = "gingdev";
  home.homeDirectory = "/home/gingdev";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nano";
    PHP_CLI_SERVER_WORKERS = "8";
    DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/podman/podman.sock";
    DOCKER_SOCK = "$XDG_RUNTIME_DIR/podman/podman.sock";
  };

  services.podman = {
    enable = true;
    package = pkgs.podman;
  };

  services.k3s.enable = true;
}
