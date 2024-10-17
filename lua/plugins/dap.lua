local dap = require("dap")
return {
  "mfussenegger/nvim-dap",
  keys = {
    { "<leader>bpt", dap.toggle_breakpoint },
  },
  {
    "mxsdev/nvim-dap-vscode-js",
    opts = {
      adapters = {
        "chrome",
      },
    },
  },
}
