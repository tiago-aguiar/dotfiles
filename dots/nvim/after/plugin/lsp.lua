local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')

lsp.preset('recommended')

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	preselect = 'item',
	formatting = {
		-- changing the order of fields so the icon is the first
		fields = {'abbr', 'kind', 'menu'},

		-- here is where the change happens
		format = function(entry, item)
			local menu_icon = {
				nvim_lsp = 'λ',
				luasnip = '⋗',
				buffer = 'Ω',
				path = '🖫',
				nvim_lua = 'Π',
			}

			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<Tab>'] = cmp_action.tab_complete(),
    	['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
		['<CR>'] = cmp.mapping.confirm({select = true}),
		['<C-j>'] = cmp_action.tab_complete(),
		['<C-k>'] = cmp_action.select_prev_or_fallback(),
	}
})

lsp.setup({})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<leader><CR>", function()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
  end, opts)

  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp.default_setup,
  },
})

lspconfig.pylsp.setup({
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = [["E501"]]
                }
            }
        }
    }
})
lspconfig.eslint.setup({})
lspconfig.lua_ls.setup({
	-- fix warning "Undefined global 'vim'"
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
})
