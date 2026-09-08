# Hyprland 0.55 replaced the text-based IPC dispatch protocol with a
# Lua one (`hl.dsp.*`), which broke the hyprland/workspaces module's
# click/scroll handling (it still sends plain-text "dispatch workspace
# N"). Fixed upstream in Alexays/Waybar#5013 (merged 2026-05-04), but
# not yet in a tagged release, so nixpkgs' 0.15.0 doesn't have it.
# TODO: drop this once nixpkgs packages a waybar release newer than
# 0.15.0 that includes the fix.
final: prev: {
  waybar = prev.waybar.overrideAttrs (oldAttrs: {
    src = prev.fetchFromGitHub {
      owner = "Alexays";
      repo = "Waybar";
      rev = "05945748dccce28bf96d26d8f64a9e69a8dd49ba";
      hash = "sha256-51R3mIt8cLNvh/X5qe9vOqeJCj0U9KRyemVE5y+OhiU=";
    };

    # Master also renamed the bundled cava subproject dir from
    # "cava-0.10.7-beta" to "cava-0.10.7" (see subprojects/libcava.wrap),
    # unrelated to the dispatch fix above but needed for this src bump to
    # build at all. Assumes the package's default cavaSupport = true,
    # which nothing in this config overrides.
    postUnpack = ''
      pushd "$sourceRoot"
      cp -R --no-preserve=mode,ownership ${
        prev.fetchFromGitHub {
          owner = "LukashonakV";
          repo = "cava";
          rev = "0.10.7";
          hash = "sha256-zkyj1vBzHtoypX4Bxdh1Vmwh967DKKxN751v79hzmgQ=";
        }
      } subprojects/cava-0.10.7
      patchShebangs .
      popd
    '';
  });
}
