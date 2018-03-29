let
  nixpkgs = builtins.fetchTarball {
    url  = "https://github.com/NixOS/nixpkgs/archive/3301258190101c6b771c70490b1e66db3e758cd3.tar.gz";
    sha256 = "1dlffgqpy0i1y1c029whp2ijbv31slwgg9s4hy2p34kmwdr1mzd4";
  };
  pkgs = import nixpkgs { config = {}; };
in
  pkgs.mkShell {
    NIX_CFLAGS_COMPILE = [ "-Wno-error=implicit-fallthrough" ]
      ++ pkgs.lib.optional pkgs.stdenv.isDarwin "-I${pkgs.chez}/lib/csv9.5.1/ta6osx";
    buildInputs = [
      pkgs.chez
      pkgs.gcc
      pkgs.python2Packages.gyp
    ];
  }
