return {
  {
    "iamcco/markdown-preview.nvim",
    init = function()
      vim.g.mkdp_images_path = "/home/sulthan/vimwiki/Pictures"
    end,
    keys = {
      { "<leader>wp", ":MarkdownPreviewToggle<CR>" },
    },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "tools-life/taskwiki",
    lazy = false,
  },
  {
    "junegunn/fzf",
    build = "./install --all",
    name = "fzf",
  },
  "junegunn/fzf.vim",

  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        { name = "zettelkasten", path = "~/vimwiki/zettel/", syntax = "markdown", ext = "md" },
        { name = "default", path = "~/vimwiki/", syntax = "markdown", ext = "md", path_html = "~/vimwiki/html/" },
      }
      vim.g.vimwiki_option_automatic_nested_syntaxes = 1
      vim.g.vimwiki_global_ext = 0
    end,
    lazy = false,
    keys = {
      { "<leader>ws", false },
      { "<c-k>", false },
      { "<c-j>", false },
      { "<c-l>", false },
      { "<leader>ws", ":VimwikiIndex 2<CR>" },
    },
  },

  {
    "michal-h21/vim-zettel",
    init = function()
      vim.g.zettel_format = "%y%m%d-%H%M"
      vim.g.nv_search_paths = {
        "~/vimwiki/zettel/",
        "~/vimwiki/",
      }
      vim.g.zettel_options = {
        {
          front_matter = {
            { type = "note" },
            { rel_path = "zettel/" },
          },
        },
      }
    end,
    lazy = false,
    keys = {
      { "<leader>zn", ":ZettelNew<space>" },
      { "<leader>zo", ":ZettelOpen<cr>" },
      { "<leader>zi", ":ZettelInsertNote<cr>" },
      { "<leader>zc", ":ZettelCapture<cr>" },
      { "<leader>zs", ":ZettelSearch<cr>" },
      { "<leader>zb", ":ZettelBackLinks<cr>" },
    },
  },
}
