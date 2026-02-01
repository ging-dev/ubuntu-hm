{ pkgs, ... }:
{
  services.podman = {
    enable = true;
    package = pkgs.podman;
  };
  xdg.configFile."systemd/user/podman.socket".source =
    "${pkgs.podman}/lib/systemd/user/podman.socket";
  xdg.configFile."systemd/user/podman.service".source =
    "${pkgs.podman}/lib/systemd/user/podman.service";
}
