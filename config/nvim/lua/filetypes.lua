-- Filetypes
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.h",
  command = "set filetype=c"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.bash",
  command = "set filetype=sh"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.go",
  command = "set filetype=go"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.rs",
  command = "set filetype=rust"
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.yml",
  command = "set filetype=yaml"
})

-- ruff auto format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    if vim.fn.executable("ruff") == 1 then
      vim.cmd("silent !ruff format %")
    end
  end,
})
