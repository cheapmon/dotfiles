# Hyprland 0.55 replaced the text-based IPC dispatch protocol with a
# Lua one (`hl.dsp.*`), which broke the hyprland/workspaces module's
# click/scroll handling (it still sends plain-text "dispatch workspace
# N"). Fixed upstream in Alexays/Waybar#5013 (merged 2026-05-04), but
# not yet in a tagged release, so nixpkgs' 0.15.0 doesn't have it.
# Tracks a master commit that also has later Hyprland fixes (quoted Lua
# dispatch arguments, event socket reconnect).
# TODO: drop this once nixpkgs packages a waybar release newer than
# 0.15.0 that includes the fix.
final: prev: let
  # Must match subprojects/libcava.wrap at the waybar rev below, which
  # expects the source in subprojects/cava-<rev>.
  cavaRev = "8d6e963db9cd29c2b3b5a5df1e46bb65c410f9cc";
in {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    src = prev.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "67ccdb075f2e366c3aac80dd5b0102319b5cdee3";
      hash = "sha256-yn/H5T8UZlnm1WJXwbPYolzX8Z5IiUMbrvs1LGxJYgI=";
    };

    # Mirrors upstream's nix/default.nix: master dropped the gtk-layer-shell
    # option, and nixpkgs' downstream patches target 0.15.0. Master also
    # added a wwan module (ModemManager), which isn't needed here.
    mesonFlags =
      prev.lib.remove "-Dgtk-layer-shell=enabled" oldAttrs.mesonFlags
      ++ ["-Dwwan=disabled"];
    patches = [];

    # Assumes the package's default cavaSupport = true, which nothing in
    # this config overrides.
    postUnpack = ''
      pushd "$sourceRoot"
      cp -R --no-preserve=mode,ownership ${
        prev.fetchFromGitHub {
          owner = "LukashonakV";
          repo = "cava";
          rev = cavaRev;
          hash = "sha256-tWY3D3sEVFDHJjO/enCu0lEobM1CF4vupavOHgIslnA=";
        }
      } subprojects/cava-${cavaRev}
      patchShebangs .
      popd
    '';
  });
}
