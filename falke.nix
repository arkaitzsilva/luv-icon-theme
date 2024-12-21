{
  description = "Luv Icon Theme";

  outputs = { self, nixpkgs, ... }: {
    packages.x86_64-linux.luvIconTheme = let
      pkgs = import nixpkgs { system = "x86_64-linux"; };
    in pkgs.stdenv.mkDerivation {
      name = "luv-icon-theme";
      src = ./.;
      installPhase = ''
        mkdir -p $out/share/icons/${pname}
        cp -r Luv-Dark/* $out/share/icons/${pname}/
      '';
      meta = with pkgs.lib; {
        description = "Un tema de iconos Luv para Linux";
        homepage = "https://github.com/arkaitzsilva/luv-icon-theme";
        license = licenses.gpl3Plus;
        maintainers = [ maintainers.arkaitzsilva ];
      };
    };

    nixosModules.luvIconTheme = { config, pkgs, ... }: {
      environment.systemPackages = [ pkgs.luvIconTheme ];
    };
  };
}

