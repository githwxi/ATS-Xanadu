{
  description = "ATS-Xanadu";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, self }:
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = nixpkgs.legacyPackages.${system}; 
      in
      {
        devShells = {
          default = with pkgs; mkShell {
            buildInputs = [
              ats2
              boehmgc
              bun
              nodejs
            ];

            shellHook = ''
              export XATSHOME=$PWD
            '';
          };
        };
      }
    );
}
