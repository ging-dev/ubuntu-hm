{ pkgs, ... }:
{
  services.podman = {
    enable = true;
    package = pkgs.podman;
  };
}
