{
  description = "A Nix-flake-based development environment";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    nixpkgs-zola-18 = {
      # Zola v0.18.0
      # See: https://www.nixhub.io/packages/zola
      url = "github:NixOS/nixpkgs/c3392ad349a5227f4a3464dce87bcc5046692fce";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-zola-18,
      ...
    }:
    let
      supportedSystems = nixpkgs.lib.systems.flakeExposed;

      forAllSystems =
        function:
        nixpkgs.lib.genAttrs supportedSystems (
          system:
          function {
            pkgs = import nixpkgs {
              inherit system;

              overlays = [
                (final: previous: {
                  zola_18 = nixpkgs-zola-18.legacyPackages.${system}.zola;
                })
              ];
            };

            inherit system;
          }
        );

      installNixPackages = pkgs: [
        pkgs.busybox
        pkgs.git
        pkgs.go-task
        pkgs.rclone
        pkgs.zola_18

        pkgs.nix
        pkgs.nixd # Nix Language Server
        pkgs.nixfmt # Nix Formatter
      ];

      installNixFormatter = pkgs: pkgs.nixfmt-tree;
    in
    {
      formatter = forAllSystems ({ pkgs, ... }: installNixFormatter pkgs);

      devShells = forAllSystems (
        { pkgs, ... }:
        {
          default = pkgs.mkShellNoCC {
            packages = installNixPackages pkgs;
          };
        }
      );

      packages = forAllSystems (
        { pkgs, ... }:
        {
          default = pkgs.buildEnv {
            name = "profile";
            paths = installNixPackages pkgs;
          };
        }
      );
    };
}
