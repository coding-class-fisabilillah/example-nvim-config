return {
  {
    "lervag/vimtex",
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      -- my settings
      vim.g.vimtex_view_method = "zathura"
    end,
  },
}
