-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
function ltrim(s)
  return s:match("^%s*(.*)")
end
vim.api.nvim_create_autocmd({ "BufReadPost", "FileReadPost", "BufWrite" }, {
  pattern = { "*.GED", "*.ged" },
  callback = function()
    local data = {
      buf = vim.fn.expand("<abuf>"),
      file = vim.fn.expand("<afile>"),
      match = vim.fn.expand("<amatch>"),
    }
    vim.schedule(function()
      vim.cmd("source $VIMRUNTIME/syntax/gedcom.vim")
      vim.cmd("set foldmethod=indent nolist ts=4")
      -- vim.cmd("%!gedcom_indent")
      local linecount = vim.api.nvim_buf_line_count(0)
      local_lines = vim.api.nvim_buf_get_lines(0, 1, linecount, true)
      for index, line in ipairs(local_lines) do
        local theline = ltrim(local_lines[index])
        print(local_lines[index])
      end
      print(local_lines)
      print("working just fine")
      print(vim.inspect(data))
    end)
  end,
})
