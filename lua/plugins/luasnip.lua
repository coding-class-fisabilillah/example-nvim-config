local ls = require("luasnip")

return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    cmd = require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } }),
    opts = {
      updateevents = "TextChanged, TextChangedI",
      enable_autosnippets = true,
      store_selection_keys = "<c-k>",
      snip_env = {
        s = function(...)
          local snip = ls.s(...)
          -- we can't just access the global `ls_file_snippets`, since it will be
          -- resolved in the environment of the scope in which it was defined.
          table.insert(getfenv(2).ls_file_snippets, snip)
        end,
        parse = function(...)
          local snip = ls.parser.parse_snippet(...)
          table.insert(getfenv(2).ls_file_snippets, snip)
        end,
      },
    },
    keys = {
      { "<tab>", false },
      { "<s-tab>", false },
      {
        "<c-k>",
        function()
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end,
        silent = true,
        mode = { "i", "s", "v" },
      },
      {
        "<c-j>",
        function()
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end,
        silent = true,
        mode = { "i", "s" },
      },
      {
        "<c-l>",
        function()
          if ls.choice_active() then
            ls.change_choice(1)
          end
        end,
        mode = "i",
      },
      {
        "<leader><leader>s",
        "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua<CR>",
      },
    },
  },
}
