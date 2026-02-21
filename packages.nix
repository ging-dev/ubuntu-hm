{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nh
    nixd
    nixfmt

    # PHP
    php
    php.packages.composer
    symfony-cli
    wp-cli

    # Nodejs
    nodejs
    pnpm
    railway

    # Python
    uv

    # Nix vms
    nixos-shell
  ];
}
