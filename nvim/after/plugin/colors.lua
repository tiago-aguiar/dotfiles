
function ColorMyPencils(color)
	color = color or "srcery"
    print(color)
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

print("call")
-- ColorMyPencils()
vim.cmd.colorscheme("terminator")
