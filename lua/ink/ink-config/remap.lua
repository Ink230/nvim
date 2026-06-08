vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pn", vim.cmd.Ex)

vim.keymap.set("i", "<CR>", function()
  local col = vim.fn.col('.')
  local prev = vim.fn.getline('.'):sub(col - 1, col - 1)
  local next = vim.fn.getline('.'):sub(col, col)

  if prev:match("[{(%[]") and next:match("[})%]]") then
    return "<CR><CR><Up><Tab>"
  else
    return "<CR>"
  end
end, { expr = true })
