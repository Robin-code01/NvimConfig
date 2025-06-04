-- lua/plugins/treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- auto-run :TSUpdate after install
  event = { "BufReadPost", "BufNewFile" }, -- lazy load on file open
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "python", "cpp", "c", "bash", "html", "javascript", "typescript", "vim", "vimdoc"
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      -- Add more modules if needed:
      -- incremental_selection = {...}
      -- textobjects = {...}
    })
  end,
}

