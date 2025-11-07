{
  description = "JetKVM minimal development environment (Go, Node.js)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            nodejs_24
            openssh
          ];
          shellHook = ''
            echo "Welcome to JetKVM development shell."
            echo "Go:      $(go version)"
            echo "Node.js: $(node --version)"
          '';
        };
      }
    );
}
