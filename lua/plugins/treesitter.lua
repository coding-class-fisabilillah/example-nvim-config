return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
        enable = true,
        disable = function(_, buf)
          local max_filesize = 10000 * 1024 -- 10 MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify("Tree sitter disabled")
            return true
          end
        end,
      },
    },
    config = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.pinescript = {
        install_info = {
          url = "/run/media/officestorage/belajar/treesitter/tree-sitter-pinescript/",
          files = { "src/parser.c", "src/scanner.c" },
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "pine", -- if filetype does not match the parser name
      }
      parser_config.gedcom = {
        install_info = {
          url = "/run/media/officestorage/belajar/treesitter/tree-sitter-gedcom/",
          files = { "src/parser.c" },
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        },
        filetype = "ged", -- if filetype does not match the parser name
      }
    end,
  },
}
