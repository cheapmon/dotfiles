{
  config,
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  # Hyprland's CAP_SYS_NICE wrapper leaks ambient capabilities to all child
  # processes. bubblewrap refuses to run when the calling process has effective
  # capabilities but the bwrap binary itself is not setuid.
  # We only patch buildFHSEnv (used by appimage-run, steam-run, etc.) instead
  # of overriding bubblewrap globally, to avoid infinite recursion.
  nixpkgs.overlays = [
    (final: prev: {
      buildFHSEnv = prev.buildFHSEnv.override (oldArgs: {
        bubblewrap = prev.writeShellScriptBin "bwrap" ''
          exec ${prev.python3}/bin/python3 -c '
import ctypes, os, sys
ctypes.CDLL(None).prctl(47, 4, 0, 0, 0)
os.execv("${prev.bubblewrap}/bin/bwrap", ["bwrap"] + sys.argv[1:])
          ' "$@"
        '';
      });
    })
  ];
}
