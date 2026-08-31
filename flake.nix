{
  description = "Neovim Flake";

  nixConfig = {

    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

  };

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    mnw.url = "github:Gerg-L/mnw";

    # [plugin].url = "";
    # then: pass it down to inputs and to the module ext plugins

  };

  outputs = inputs @ {
    self,
    nixpkgs,
    mnw,
    ...
  }: let

    forAllSystems = nixpkgs.lib.genAttrs ( nixpkgs.lib.platforms.all );

  in {

    packages = forAllSystems ( system:
      let

        pkgs = import nixpkgs {
          inherit system;
          overlays = [ inputs.neovim-nightly-overlay.overlays.default ];
        };

        # extPlugins = import ./plugins.nix;

      in {

        default = mnw.lib.wrap pkgs {

          neovim = pkgs.neovim-unwrapped;
          # luaFiles = [ ./init.lua ];

          plugins = {
            # List of plugins to load automatically
            # start = [] ++ extPlugins.start;
            start = with pkgs.vimPlugins; [
              lazy-nvim
            ];

            # List of plugins to not load automatically
            # opt = [] ++ extPlugins.opt;
            opt = with pkgs.vimPlugins; [
              vimtex
            ];

            dev.myconfig = {
              pure = ./nvim;
              impure = "/home/antonio/neovim/nvim";
            };
          };

        };

    } );

    # dev = forAllSystems ( system: self.packages.${system}.default.devMode );

  };
}
