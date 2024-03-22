require'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Tab>",
      node_incremental = "<Tab>",
      scope_incremental = "<S-Tab>",
      node_decremental = "<BS>",
    },
  },
}
