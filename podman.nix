{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.podman;
in
{
  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      DOCKER_HOST = "unix://$XDG_RUNTIME_DIR/podman/podman.sock";
      DOCKER_SOCK = "$XDG_RUNTIME_DIR/podman/podman.sock";
    };

    systemd.user.sockets = {
      podman = {
        Unit = {
          Description = "Podman API Socket";
          Documentation = [ "man:podman-system-service(1)" ];
        };

        Socket = {
          ListenStream = "%t/podman/podman.sock";
          SocketMode = "0660";
        };

        Install = {
          WantedBy = [ "sockets.target" ];
        };
      };
    };
    systemd.user.services.podman = {
      Unit = {
        Description = "Podman API Service";
        Requires = [ "podman.socket" ];
        After = [ "podman.socket" ];
        Documentation = [ "man:podman-system-service(1)" ];
        StartLimitIntervalSec = 0;
      };

      Service = {
        Delegate = true;
        Type = "exec";
        KillMode = "process";
        Environment = [ "LOGGING=--log-level=info" ];
        ExecStart = "${pkgs.podman}/bin/podman $LOGGING system service";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
