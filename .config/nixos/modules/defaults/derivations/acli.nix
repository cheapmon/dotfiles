{
  stdenv,
  fetchurl,
}:
stdenv.mkDerivation {
  name = "acli";
  src = fetchurl {
    url = "https://acli.atlassian.com/linux/latest/acli_linux_amd64/acli";
    sha256 = "MCrWMi4xUtGMR4IVSOKgnARcA14B7pDFU25S+DIC6HQ=";
  };
  unpackPhase = ''
    runHook preUnpack
    runHook postUnpack
  '';
  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    cp $src $out/bin/acli
    chmod +x $out/bin/acli

    runHook postInstall
  '';
}
