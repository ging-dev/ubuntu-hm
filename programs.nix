{ ... }:
{
  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    starship.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
          name = "ging-dev";
          email = "thanh1101dev@gmail.com";
        };
      };
    };

    fish = {
      enable = true;
      interactiveShellInit = ''
        set fish_greeting # Disable greeting
      '';
    };
  };
}
