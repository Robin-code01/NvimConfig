return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 7,
        open_mapping = [[<C-\>]],
        direction = "horizontal",
        shade_terminals = true,
        start_in_insert = true,
      })
    end,
  },
}
