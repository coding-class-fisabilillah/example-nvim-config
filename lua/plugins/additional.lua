return {
  {
    "dhruvasagar/vim-table-mode",
    keys = {
      { "<leader>tmm", ":TableModeToggle<CR>" },
    },
  },
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
    },
  },
  {
    "jakobkhansen/journal.nvim",
    config = function()
      require("journal").setup({
        root = "/run/media/officestorage/kerja/bilal_ahmed/journal",
        journal = {
          entries = {
            day = {
              format = "%Y/%m-%B/daily/%d-%A",
              template = "# Today's Progress %A %B %d %Y\n\n## Progress\n\n## Experiments",
              frequency = { day = 1 },
            },
          },
        },
      })
    end,
  },
  { "sindrets/diffview.nvim" },
  {
    "jesseleite/nvim-macroni",
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      foldlevel = 1,
      background_colour = "#000000",
    },
  },
  {
    "preservim/tagbar",
    keys = {
      { "<leader>rg", ":TagbarToggle<CR>" },
    },
  },
  {
    "junegunn/goyo.vim",
    config = function()
      local goyo_group = vim.api.nvim_create_augroup("GoyoGroup", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        desc = "Hide lualine on goyo enter",
        group = goyo_group,
        pattern = "GoyoEnter",
        callback = function()
          require("lualine").hide()
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        desc = "Show lualine after goyo exit",
        group = goyo_group,
        pattern = "GoyoLeave",
        callback = function()
          require("lualine").hide({ unhide = true })
        end,
      })
    end,
    lazy = false,
  },
  {
    "ThePrimeagen/vim-be-good",
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      require("harpoon"):setup({})
    end,
    keys = {
      {
        "<leader>ah",
        function()
          local conf = require("telescope.config").values
          local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
              table.insert(file_paths, item.value)
            end

            require("telescope.pickers")
              .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                  results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
              })
              :find()
          end
          toggle_telescope(require("harpoon"):list())
        end,
        desc = "Open harpoon window",
      },
      {
        "<leader>AH",
        function()
          require("harpoon"):list():append()
        end,
        desc = "harpoon file",
      },
      {
        "<C-S-P>",
        function()
          require("harpoon"):list():prev()
        end,
      },
      {
        "<C-S-N>",
        function()
          require("harpoon"):list():prev()
        end,
      },
      {
        "<leader>1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = "harpoon to file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = "harpoon to file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = "harpoon to file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = "harpoon to file 4",
      },
      {
        "<leader>5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = "harpoon to file 5",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    lazy = true,
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  {
    "mbbill/undotree",
    lazy = true,
    keys = {
      { "<leader>uu", vim.cmd.UndotreeToggle, desc = "UndotreeToggle" },
    },
  },

  {
    "luukvbaal/nnn.nvim",
    config = function()
      require("nnn").setup({
        picker = {
          cmd = "tmux new-session -A -s nnnpicker nnn -Pp",
          style = { border = "rounded" },
          session = "local",
        },
        explorer = {
          cmd = "nnn -G -o",
          session = "local",
        },
        quitcd = "cd",
        auto_open = {
          setup = "picker",
          empty = true,
        },
      })
    end,
    keys = {
      { "<leader>nn", ":NnnExplorer %:p:h<cr>" },
      { "<leader>np", ":NnnPicker %:p:h<cr>" },
    },
  },
}
