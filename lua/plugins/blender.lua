return {
  {
    "b0o/blender.nvim",
    keys = {
      { "<leader>bbl", ":Blender<cr>", desc = "blender addon helper" },
    },
    config = function()
      require("blender").setup({
        profiles = {
          {
            name = "blender 410",
            cmd = "/run/media/officestorage/gudang/sources/blendersrc/stable/blender-4.1.0-stable.40a5e739e270/blender",
            extra_args = { "/run/media/officestorage/kerja/bilal_ahmed/Assets/auto_placement_.blend" },
          },
          {
            name = "blender 411",
            cmd = "/run/media/officestorage/gudang/sources/blendersrc/stable/blender-4.1.1-stable.e1743a0317bc/blender",
            extra_args = { "/run/media/officestorage/kerja/bilal_ahmed/Assets/auto_placement_.blend" },
          },
        },
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "grapp-dev/nui-components.nvim",
      "mfussenegger/nvim-dap",
      "LiadOz/nvim-dap-repl-highlights",
    },
  },
}
