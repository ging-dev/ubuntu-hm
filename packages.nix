{ pkgs, ... }:
{
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

    # K8s
    minikube
    kubectl
  ];
}
