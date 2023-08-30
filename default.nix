{ pkgs , ...}:

pkgs.callPackage pkgs.rustPlatform.buildRustPackage {
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