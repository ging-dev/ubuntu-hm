self: super: {
  php = super.php.buildEnv {
    extensions = (
      { enabled, all }:
      enabled
      ++ (with all; [
        xdebug
      ])
    );
    extraConfig = ''
      xdebug.mode=debug
    '';
  };
  wp-cli = super.wp-cli.override {
    phpIniFile = (super.formats.ini { }).generate "wp-cli.ini" {
      PHP.memory_limit = -1;
      Phar."phar.readonly" = "Off";
    };
  };

  k3s = super.k3s.overrideAttrs (finalAttrs: previousAttrs: {
    k3sRuntimeDeps = builtins.filter
      (pkg: (super.lib.getName pkg) != "shadow") 
      previousAttrs.k3sRuntimeDeps;
  });
}
