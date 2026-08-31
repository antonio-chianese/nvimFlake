let

  startPlugins = [
    "lervag/vimtex"
  ];

  optPlugins = [ ];

  # --------------------------------------------------------------------

  getName = repo: builtins.toString ( builtins.match ".*/(.*)" repo );

  constructPlugin = repo: {
    pname = getName repo;
    src = "https://github.com/${repo}.git";
  };

  start = map constructPlugin startPlugins;
  opt = map constructPlugin optPlugins;
in
  { inherit start opt; }
