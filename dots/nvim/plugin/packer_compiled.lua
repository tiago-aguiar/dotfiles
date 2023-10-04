-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/tiagoaguiar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/tiagoaguiar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/tiagoaguiar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/tiagoaguiar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/tiagoaguiar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  srcery = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\23colorscheme srcery\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/srcery",
    url = "https://github.com/srcery-colors/srcery-vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nN\0\0\5\1\4\0\b6\0\0\0006\2\1\0009\2\2\2-\4\0\0009\4\3\4B\2\2\0A\0\0\1K\0\1\0\4¿\23get_selected_entry\finspect\bvim\nprintê\2\1\2\f\0\18\0\0266\2\0\0'\4\1\0B\2\2\0026\3\0\0'\5\2\0B\3\2\0026\4\0\0'\6\3\0B\4\2\0029\5\4\0035\a\16\0005\b\14\0005\t\f\0005\n\6\0009\v\5\2=\v\a\n9\v\b\2=\v\t\n3\v\n\0=\v\v\n=\n\r\t=\t\15\b=\b\17\aB\5\2\0012\0\0ÄK\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<c-a>\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\28telescope.actions.state\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-colorscheme-switcher"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/vim-colorscheme-switcher",
    url = "https://github.com/xolox/vim-colorscheme-switcher"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-misc"] = {
    loaded = true,
    path = "/Users/tiagoaguiar/.local/share/nvim/site/pack/packer/start/vim-misc",
    url = "https://github.com/xolox/vim-misc"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: srcery
time([[Config for srcery]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\23colorscheme srcery\bcmd\bvim\0", "config", "srcery")
time([[Config for srcery]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\5\1\4\0\b6\0\0\0006\2\1\0009\2\2\2-\4\0\0009\4\3\4B\2\2\0A\0\0\1K\0\1\0\4¿\23get_selected_entry\finspect\bvim\nprintê\2\1\2\f\0\18\0\0266\2\0\0'\4\1\0B\2\2\0026\3\0\0'\5\2\0B\3\2\0026\4\0\0'\6\3\0B\4\2\0029\5\4\0035\a\16\0005\b\14\0005\t\f\0005\n\6\0009\v\5\2=\v\a\n9\v\b\2=\v\t\n3\v\n\0=\v\v\n=\n\r\t=\t\15\b=\b\17\aB\5\2\0012\0\0ÄK\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\n<c-a>\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\28telescope.actions.state\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
