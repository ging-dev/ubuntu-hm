{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.k3s;
in
{
  options.services.k3s = {
    enable = lib.mkEnableOption "K3s - Lightweight Kubernetes";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      slirp4netns
      fuse-overlayfs
      k3s
    ];

    systemd.user.services.k3s = {
      Unit = {
        Description = "k3s (Rootless)";
        Documentation = [ "man:k3s(1)" ];
      };

      Service = {
        Delegate = true;
        Type = "simple";
        KillMode = "mixed";
        ExecStart = "${pkgs.k3s}/bin/k3s server --rootless --snapshotter=fuse-overlayfs";
        ExecReload = "${pkgs.k3s}/bin/k3s server --rootless --snapshotter=fuse-overlayfs --restart";
        TimeoutSec = 0;
        RestartSec = 2;
        Restart = "always";
        StartLimitBurst = 3;
        StartLimitIntervalSec = "60s";
        LimitNOFILE = "infinity";
        LimitNPROC = "infinity";
        LimitCORE = "infinity";
        TasksMax = "infinity";
      };

      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
