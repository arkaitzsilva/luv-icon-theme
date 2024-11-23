{ lib, stdenv, fetchFromGitHub, installShell }:

stdenv.mkDerivation rec {
  pname = "luv-icon-theme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "arkaitzsilva";de GitHub
    repo = "luv-icon-theme";
    rev = "main";
    sha256 = "0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"; # Cambia esto por el hash correcto
  };

  installPhase = ''
    mkdir -p $out/share/icons/${pname}
    cp -r Luv-Dark/* $out/share/icons/${pname}/
  '';

  meta = with lib; {
    description = "Luv Icon Theme";
    homepage = "https://github.com/arkaitzsilva/luv-icon-theme";
    license = licenses.mit; # Cambia esto si usas otra licencia
    maintainers = with maintainers; [ arkaitzsilva ];
  };
}

