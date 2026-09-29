# Keeps modules/extras/ present when no other extras are checked out, so
# import-tree in flake.nix doesn't fail on a missing directory.
{...}: {}
