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

          initLua = builtins.readFile ./nvim/init.lua;

          # luaFiles = [ ./nvim/lua ];

          plugins = {
            # List of plugins to load automatically
            # start = [] ++ extPlugins.start;
            start = with pkgs.vimPlugins; [
              lz-n
              gruvbox-material
              luasnip

              # nvim-treesitter.withAllGrammars
              (nvim-treesitter.withPlugins (p: with p; [
                # List of plugins: https://search.nixos.org/packages?channel=unstable&sort=alpha_asc&type=packages&query=vimPlugins.nvim-treesitter-parsers

                comment # highlight todos and more
                lua
                python
                bash
                nix

                latex
                typst

                css
                html
                javascript

                json
                yaml
                toml
                csv
              ]))
            ];

            # List of plugins to not load automatically
            # opt = [] ++ extPlugins.opt;
            opt = with pkgs.vimPlugins; [
              vimtex

	            oil-nvim
	            nvim-web-devicons
            ];

            dev.myconfig = {
              pure = ./nvim;
              impure = "/home/$(whoami)/Documents/_to-order/nvimFlake/nvim";
            };
          };

          extraBinPath = with pkgs; [
            # lsps
            # https://langserver.org/
            ruff
            lua-language-server
            texlab
            clang-tools
            nixd
          ];

          extraLuaPackages = p: [
            p.jsregexp # luasnip dependency
          ];
        };

    } );

    dev = forAllSystems ( system: self.packages.${system}.default.devMode );

  };
}
