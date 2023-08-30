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
      uid = pkgs.callPackage ./. {};
      
      default = self.packages.${system}.uid;
    };
  };
}
