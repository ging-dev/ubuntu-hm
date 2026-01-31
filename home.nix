{ pkgs, ... }:
{
  imports = [
    ./programs.nix
  ];
  home.packages = with pkgs; [
    nixd
    nixfmt
    devenv
    # For development environment

    # PHP
    php
    php.packages.composer
    symfony-cli
    wp-cli

    # Nodejs
    nodejs
    pnpm

    # Python
    uv
  ];

  home.username = "gingdev";
  home.homeDirectory = "/home/gingdev";
  home.stateVersion = "25.11";
  home.sessionVariables = {
    EDITOR = "nano";
    PHP_CLI_SERVER_WORKERS = "8";
  };
}
