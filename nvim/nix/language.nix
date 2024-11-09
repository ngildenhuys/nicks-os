{
  plugins = {
    conform-nvim = {
      enable = true;
      settings = {formatters_by_ft.nix = ["alejandra"];};
    };

    lsp.servers.nil_ls.enable = true;

    none-ls.sources.formatting.alejandra.enable = true;
  };
}
