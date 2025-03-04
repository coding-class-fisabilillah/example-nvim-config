local dap = require("dap")

require("dap-python").setup(vim.fn.getcwd() .. "/libs/bin/python")
table.insert(dap.configurations.python, {
  type = "python",
  request = "launch",
  name = "Django",
  program = vim.fn.getcwd() .. "/manage.py",
  args = { "runserver", "--noreload" },
})

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
