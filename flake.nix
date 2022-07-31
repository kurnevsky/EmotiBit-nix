{
  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixos-22.05";
    };
  };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
          (callPackage ./openframeworks.nix { })
          (callPackage ./arduino-fwuploader.nix { })
          (callPackage ./firmware-uploader.nix { })
          (bossa.overrideAttrs (old: rec {
            version = "1.7.0";
            src = fetchFromGitHub {
              owner = "shumatech";
              repo = "BOSSA";
              rev = version;
              sha256 = "sha256-yn8ZNyjny1JF8MwPtCtzUGeXWxM92rqrg5glSyQxMCE=";
            };
            patches = [
              (fetchpatch {
                url =
                  "https://github.com/shumatech/BOSSA/commit/3ace00ee9a5a1372c321f4b97b941eb7c040ef80.patch";
                sha256 = "sha256-o24IVj23KoUVwqPhX3i2Do2LkdMi951wRtDkwyXq9wc=";
              })
            ];
          }))
        ];
      };
    };
}
