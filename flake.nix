{ lib, stdenv, fetchFromGitHub, installShell }:

stdenv.mkDerivation rec {
  pname = "luv-icon-theme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "arkaitzsilva";
    repo = "luv-icon-theme";
    rev = "main";
    sha256 = lib.fakeSha256;
  };

  installPhase = ''
    mkdir -p $out/share/icons/${pname}
    cp -r Luv-Dark/* $out/share/icons/${pname}/
  '';

  meta = with lib; {
    description = "Luv Icon Theme";
    homepage = "https://github.com/arkaitzsilva/luv-icon-theme";
    license = with licenses; [ gpl3Only ];
    maintainers = with maintainers; [ arkaitzsilva ];
  };
}
