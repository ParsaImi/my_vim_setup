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
local package_path_str = "/home/parsa/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?.lua;/home/parsa/.cache/nvim/packer_hererocks/2.1.1713484068/share/lua/5.1/?/init.lua;/home/parsa/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?.lua;/home/parsa/.cache/nvim/packer_hererocks/2.1.1713484068/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/parsa/.cache/nvim/packer_hererocks/2.1.1713484068/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/go.nvim",
    url = "https://github.com/ray-x/go.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  harpoon = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neovim = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/neovim",
    url = "https://github.com/rose-pine/neovim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nc\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\4\0\0\a()\a[]\a{}\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%]\nmatch\14prev_charÞ\b\1\0\v\0004\1n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\0036\4\15\0009\4\16\4'\6\17\0'\a\18\0'\b\19\0B\4\4\2=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\0016\0\0\0'\2\24\0B\0\2\0026\1\0\0'\3\25\0B\1\2\0029\2\26\1\18\4\2\0009\2\27\2'\5\28\0009\6\29\0B\6\1\0A\2\2\0016\2\0\0'\4\30\0B\2\2\0026\3\0\0'\5\1\0B\3\2\0029\4\31\0034\6\5\0\18\a\2\0'\t \0'\n \0B\a\3\2\18\t\a\0009\a!\a3\n\"\0B\a\3\2>\a\1\6\18\a\2\0'\t#\0'\n$\0B\a\3\2\18\t\a\0009\a!\a3\n%\0B\a\3\2\18\t\a\0009\a&\a3\n'\0B\a\3\2\18\t\a\0009\a(\a'\n)\0B\a\3\2>\a\2\6\18\a\2\0'\t*\0'\n+\0B\a\3\2\18\t\a\0009\a!\a3\n,\0B\a\3\2\18\t\a\0009\a&\a3\n-\0B\a\3\2\18\t\a\0009\a(\a'\n.\0B\a\3\2>\a\3\6\18\a\2\0'\t/\0'\n0\0B\a\3\2\18\t\a\0009\a!\a3\n1\0B\a\3\2\18\t\a\0009\a&\a3\n2\0B\a\3\2\18\t\a\0009\a(\a'\n3\0B\a\3\0?\a\0\0B\4\2\1K\0\1\0\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\14with_pair\6 \14add_rules\24nvim-autopairs.rule\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\17custom_pairs\1\0\3\6|\6|\b/**\a*/\6<\6>\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\b\19highlight_grey\fComment\nchars\0\bmap\n<M-e>\14highlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fend_key\6$\fpattern\0\16check_comma\2\21disable_filetype\1\3\0\0\20TelescopePrompt\bvim\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\3\blua\0\tjava\1\15javascript\0\1\2\0\0\vstring\1\0\a\21disable_filetype\0\14fast_wrap\0\14ts_config\0\rcheck_ts\2\17custom_pairs\0\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\t€€À™\4\0" },
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/parsa/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nc\0\1\6\0\6\1\f9\1\0\0\18\3\1\0009\1\1\0019\4\2\0\23\4\0\0049\5\2\0B\1\4\0026\2\3\0009\2\4\0025\4\5\0\18\5\1\0D\2\3\0\1\4\0\0\a()\a[]\a{}\17tbl_contains\bvim\bcol\bsub\tline\2\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%)\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%}\nmatch\14prev_char\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0G\0\1\5\0\3\0\v9\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\v\1\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\b.%]\nmatch\14prev_charÞ\b\1\0\v\0004\1n6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\0036\4\15\0009\4\16\4'\6\17\0'\a\18\0'\b\19\0B\4\4\2=\4\20\3=\3\21\0025\3\22\0=\3\23\2B\0\2\0016\0\0\0'\2\24\0B\0\2\0026\1\0\0'\3\25\0B\1\2\0029\2\26\1\18\4\2\0009\2\27\2'\5\28\0009\6\29\0B\6\1\0A\2\2\0016\2\0\0'\4\30\0B\2\2\0026\3\0\0'\5\1\0B\3\2\0029\4\31\0034\6\5\0\18\a\2\0'\t \0'\n \0B\a\3\2\18\t\a\0009\a!\a3\n\"\0B\a\3\2>\a\1\6\18\a\2\0'\t#\0'\n$\0B\a\3\2\18\t\a\0009\a!\a3\n%\0B\a\3\2\18\t\a\0009\a&\a3\n'\0B\a\3\2\18\t\a\0009\a(\a'\n)\0B\a\3\2>\a\2\6\18\a\2\0'\t*\0'\n+\0B\a\3\2\18\t\a\0009\a!\a3\n,\0B\a\3\2\18\t\a\0009\a&\a3\n-\0B\a\3\2\18\t\a\0009\a(\a'\n.\0B\a\3\2>\a\3\6\18\a\2\0'\t/\0'\n0\0B\a\3\2\18\t\a\0009\a!\a3\n1\0B\a\3\2\18\t\a\0009\a&\a3\n2\0B\a\3\2\18\t\a\0009\a(\a'\n3\0B\a\3\0?\a\0\0B\4\2\1K\0\1\0\6]\0\0\a ]\a[ \6}\0\0\a }\a{ \6)\fuse_key\0\14with_move\0\a )\a( \0\14with_pair\6 \14add_rules\24nvim-autopairs.rule\20on_confirm_done\17confirm_done\aon\nevent\bcmp\"nvim-autopairs.completion.cmp\17custom_pairs\1\0\3\6|\6|\b/**\a*/\6<\6>\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\b\19highlight_grey\fComment\nchars\0\bmap\n<M-e>\14highlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\fend_key\6$\fpattern\0\16check_comma\2\21disable_filetype\1\3\0\0\20TelescopePrompt\bvim\14ts_config\15javascript\1\2\0\0\20template_string\blua\1\0\3\blua\0\tjava\1\15javascript\0\1\2\0\0\vstring\1\0\a\21disable_filetype\0\14fast_wrap\0\14ts_config\0\rcheck_ts\2\17custom_pairs\0\22ignored_next_char\v[%w%.]\30enable_check_bracket_line\2\nsetup\19nvim-autopairs\frequire\t€€À™\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)

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
