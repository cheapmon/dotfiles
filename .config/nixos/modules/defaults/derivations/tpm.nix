{
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation rec {
  pname = "tpm";
  version = "unstable-2024-11-12";

  src = fetchFromGitHub {
    owner = "tmux-plugins";
    repo = "tpm";
    rev = "99469c4a9b1ccf77fade25842dc7bafbc8ce9946";
    sha256 = "sha256-hW8mfwB8F9ZkTQ72WQp/1fy8KL1IIYMZBtZYIwZdMQc=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/tmux/plugins
    cp -r . $out/share/tmux/plugins/tpm

    runHook postInstall
  '';
}
