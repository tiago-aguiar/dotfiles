local builtin = require('telescope.builtin')

vim.keymap.set("n", "<leader>d", vim.cmd.Ex)
vim.keymap.set("n", "<leader>k", vim.cmd.bd)
vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>o', builtin.git_files, {})
vim.keymap.set('n', '<leader>s', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- using telescope to :buffers alternative
vim.keymap.set('n', '<leader>b', function() builtin.buffers({
	-- on_complete = { function() vim.cmd"stopinsert" end }, -- starts on normal mode
	sort_mru=true,
	ignore_current_buffer=true
}) end)
