{
  description = "Uuid Flake";

  inputs = {
    nixpkgs.url = github:NixOs/nixpkgs/nixos-23.05;
  };

  outputs = {
    self,
    nixpkgs 
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system} = {
      uid = pkgs.callPackage pkgs.rustPlatform.buildRustPackage {
        pname = "uid";
        version = "0.0.1";
        src = ./.;
        cargoBuildFlags = "-p uid";

        cargoLock = {
          lockFile = ./Cargo.lock;
        };

        nativeBuildInputs = [ pkgs.pkg-config ];
        PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
      };
      
      default = self.packages.${system}.uid;
    };
  };
}
