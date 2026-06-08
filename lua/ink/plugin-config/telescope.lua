local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pe", builtin.find_files, {})
vim.keymap.set("n", "<leader>pi", builtin.git_files, {})
vim.keymap.set("n", "<leader>po", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
