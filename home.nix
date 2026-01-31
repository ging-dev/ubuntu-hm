{ ... }:
{
  imports = [
    ./packages.nix
    ./programs.nix
    ./services.nix
  ];

  home.username = "gingdev";
  home.homeDirectory = "/home/gingdev";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nano";
    PHP_CLI_SERVER_WORKERS = "8";
  };
}
