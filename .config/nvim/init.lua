local theme = "light"

-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

function isModuleAvailable(name)
	if package.loaded[name] then
		return true
	else
		for _, searcher in ipairs(package.searchers or package.loaders) do
			local loader = searcher(name)
			if type(loader) == "function" then
				package.preload[name] = loader
				return true
			end
		end
		return false
	end
end

vim.api.nvim_exec(
	[[
  autocmd FileType svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType ts setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType tsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType swift autocmd BufWritePost *.swift :silent exec "!swiftformat %"
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]],
	false
)
-- augroup Packer
-- autocmd!
-- autocmd BufWritePost init.lua PackerCompile
-- augroup end
-- autocmd BufWritePre *.svelte :Format
-- autocmd BufWritePre *.rs :Format
-- autocmd BufWritePre *.ts :Format
-- autocmd BufWritePre *.tsx :Format
-- autocmd BufWritePre *.js :Format
-- autocmd BufWritePre *.yml :Format
-- autocmd BufWritePre *.json :Format

local use = require("packer").use
require("packer").startup(function()
	use("wbthomason/packer.nvim") -- Package manager
	use("tpope/vim-fugitive") -- Git commands in nvim
	use("tpope/vim-rhubarb") -- Fugitive-companion to interact with github
	use("tpope/vim-commentary") -- "gc" to comment visual regions/lines

	use("tpope/vim-repeat")
	use("ggandor/leap.nvim")
	use({ "chrisgrieser/nvim-spider" })

	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	})

	use("nvim-lua/plenary.nvim")

	use("kyazdani42/nvim-web-devicons")

	use({
		"someone-stole-my-name/yaml-companion.nvim",
		requires = {
			{ "neovim/nvim-lspconfig" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function() end,
	})

	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	use({
		"ibhagwan/fzf-lua",
		-- optional for icon support
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})

	use({
		"gelguy/wilder.nvim",
		config = function()
			-- config goes here
		end,
	})

	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }) -- We recommend updating the parsers on update
	use("nvim-treesitter/nvim-treesitter-context")

	-- use "folke/trouble.nvim"
	use("dmmulroy/tsc.nvim")

	use({
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	})

	use("folke/neodev.nvim")

	-- UI to select things (files, grep results, open buffers...)
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- use { "nvim-telescope/telescope-file-browser.nvim" }
	-- Add indentation guides even on blank lines
	use("lukas-reineke/indent-blankline.nvim")
	-- Add git related info in the signs columns and popups
	use({ "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" } })
	use("neovim/nvim-lspconfig") -- Collection of configurations for built-in LSP client
	use("ray-x/lsp_signature.nvim")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	-- use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")

	use("NvChad/nvim-colorizer.lua")

	-- use("rcarriga/nvim-notify")

	use("stevearc/conform.nvim")

	-- use 'nvimtools/none-ls.nvim'
	use("simrat39/rust-tools.nvim")

	use("jparise/vim-graphql")
	use("prisma/vim-prisma")

	use("jackguo380/vim-lsp-cxx-highlight")
	use("tikhomirov/vim-glsl")

	use("jonsmithers/vim-html-template-literals")

	use("feline-nvim/feline.nvim")

	-- swift
	use("vim-syntastic/syntastic")
	use("keith/swift.vim")

	use({
		"wojciech-kulik/xcodebuild.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("xcodebuild").setup({
				-- put some options here or leave it empty to use default settings
			})
		end,
	})
	use("mfussenegger/nvim-dap")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
end)

SetTheme = function()
	vim.api.nvim_exec(
		[[
  function! SetSharedThemeColors()
    hi Constant guibg=none guifg=#0CA8FC
    hi Group guibg=none
    hi Error guibg=#ed1b04 guifg=#ffe1dd
    hi Warning guibg=#ffe100 guifg=#1c1c1c
    hi NvimTreeFolderIcon guifg=#3474eb
    hi NvimTreeFolderName guifg=#3474eb
    hi NvimTreeOpenedFolderName guifg=#9c34eb
    hi NvimTreeOpenedFile guifg=#9c34eb
    hi FloatermBorder guibg=none guifg=#555555
    hi htmlArg gui=italic

    " Errors in Red
    hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
    " Warnings in Yellow
    hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
    " Info and Hints in White
    hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
    hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White

    " Underline the offending code
    hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
    hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
    hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
    hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline

    hi TreesitterContext guibg=White
  endfunction

  function! UseDarkThemeColors()
    set background=dark
    colorscheme Parapluie

    hi Normal guifg=#FFFFFF guibg=none
    hi Special guibg=none guifg=#FFFFFF
    hi NonText guifg=#575757 guibg=none
    hi MatchParen guibg=#323232 guifg=#888888
    hi Search guibg=#7B00D2 guifg=none gui=bold
    hi TabLine guibg=#333333 guifg=#aa88ee gui=bold
    hi TabLineSel guibg=#442288 guifg=#aa88ee gui=bold
    hi StatusLine guibg=NONE guifg=#777777 gui=none
    hi StatusLineNC guibg=NONE guifg=#333333 gui=none
    hi VertSplit guibg=none guifg=#333333
    hi Comment guibg=NONE guifg=#7777aa gui=italic cterm=italic
    hi SignColumn guibg=none
    hi CursorLineNr guifg=#333333 guibg=none
    hi CursorLine guibg=none guifg=#FFFFFF gui=bold
    hi LineNr guibg=none guifg=#333355
    hi Whitespace guibg=none guifg=#444455
    hi IndentBlanklineChar guibg=none guifg=#444466 gui=nocombine
    hi GitGutterAdd guibg=none guifg=#89E455
    hi GitGutterChange guibg=none guifg=#0CA8FC
    hi GitGutterDelete guibg=none guifg=#FB263F
    hi GitGutterChangeDelete guibg=none guifg=#0CA8FC
    hi TrailingSpace guibg=#424242 guifg=#ffffff

    call matchadd('TrailingSpace', '\s\+$', 80)
    call SetSharedThemeColors()
  endfunction

  function! UseLightThemeColors()
    set background=light
    colorscheme Parasol

    hi Normal guibg=none guifg=#000000
    hi Special guibg=none guifg=#000000
    hi NonText guifg=#BBBBBB guibg=none
    hi EndOfBuffer guifg=#bbbbbb guibg=none
    hi BookmarkLine guibg=158 guibg=none
    hi BookmarkSign guibg=none guifg=black
    hi VertSplit guibg=none guifg=#eeeeee
    hi IndentBlanklineChar guibg=none guifg=#aaaaaa gui=nocombine
    hi Beacon guibg=#aaaaee
    hi TabLine guibg=none guifg=#aaaacc gui=none
    hi TabLineSel guibg=none guifg=#222244 gui=none
    hi TabLineFill guibg=none guifg=#222244 gui=none
    hi MatchParen guibg=none guifg=#0ca8fc
    hi Search guibg=#FECB32 guifg=none gui=bold
    hi IncSearch guibg=#FECB32 guifg=none gui=bold
    hi FzfLuaBufName guifg=#222244 gui=none guibg=none
    hi FzfLuaBufNr guifg=#222244 gui=none guibg=none
    hi FzfLuaBufLineNr guifg=#222244 gui=none guibg=none
    hi StatusLine guibg=none guifg=#554477 gui=none
    hi StatusLineNC guibg=none guifg=#554477 gui=none
    hi Comment guibg=NONE guifg=#aaaaaa gui=italic cterm=italic
    hi RustHints guibg=#EAF9FF guifg=#006CAD gui=none
    hi SignColumn guibg=none
    hi CursorLineNr guibg=#b5dafc
    hi CursorLine guibg=none guifg=#000000 gui=bold
    hi Cursor guibg=none guifg=#0CA8FC
    hi LineNr guibg=none guifg=#aaaaaa
    hi GitGutterAdd guibg=#baf49c guifg=#3a990a
    hi GitGutterChange guibg=#b5dafc guifg=#0CA8FC
    hi Whitespace guibg=none guifg=#eeeeee
    hi GitGutterDelete guibg=#f7b4be guifg=#e0081e
    hi GitGutterChangeDelete guibg=#b5dafc guifg=#0CA8FC
    hi TrailingSpace guibg=#eeeeee guifg=#888888
    hi EndOfBuffer guibg=none guifg=#ffffff

    hi CompeDocumentation guibg=#ffffff guifg=#222222
    hi CompeDocumentationBorder guibg=#ffffff guifg=#000000
    hi Pmenu guibg=#ffffff guifg=#222222

    call matchadd('TrailingSpace', '\s\+$', 80)
    call SetSharedThemeColors()
  endfunction
  ]],
		false
	)

	if theme == "dark" then
		vim.api.nvim_exec(
			[[
      au VimEnter * call UseDarkThemeColors()
    ]],
			false
		)
	else
		vim.api.nvim_exec(
			[[
      au VimEnter * call UseLightThemeColors()
    ]],
			false
		)
	end
end

SetTheme()

function map(modes, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = opts.noremap == nil and true or opts.noremap
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		if type(rhs) == "string" then
			vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
		else
			opts.callback = rhs
			vim.api.nvim_set_keymap(mode, lhs, "", opts)
		end
	end
end

if isModuleAvailable("neodev") then
	require("neodev").setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
		-- add any options here, or leave empty to use the default settings
	})
end
if isModuleAvailable("dapui") then
	require("dapui").setup()
end

if isModuleAvailable("leap") then
	require("leap").add_default_mappings()
	vim.keymap.del({ "x", "o" }, "x")
	vim.keymap.del({ "x", "o" }, "X")
	vim.keymap.del({ "x", "o" }, "s")
	vim.keymap.del({ "x", "o" }, "S")
end

if isModuleAvailable("spider") then
	vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
	vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
	vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
	vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
end

local nvim_lsp = require("lspconfig")

local cmp
local capabilities

if isModuleAvailable("cmp") then
	local kind_icons = {
		Text = "",
		Method = "󰊕",
		Function = "󰊕",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "",
		Interface = "",
		Module = "󰕳",
		Property = "",
		Unit = "",
		Value = "#",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "ℇ",
		Struct = "",
		Event = "",
		Operator = "",
		TypeParameter = "󰛦",
	}
	-- Set up nvim-cmp.
	cmp = require("cmp")

	cmp.setup({
		formatting = {
			format = function(entry, vim_item)
				-- vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
				vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- This concatonates the icons with the name of the item kind
				-- Source
				-- vim_item.menu = ({
				-- 	buffer = " 裸",
				-- 	nvim_lsp = " 溜",
				-- 	luasnip = " 車",
				-- 	nvim_lua = "  ",
				-- 	latex_symbols = "  ",
				-- })[entry.source.name]
				return vim_item
			end,
		},
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		}),
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "vsnip" }, -- For vsnip users.
			-- { name = 'luasnip' }, -- For luasnip users.
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		}, {
			{ name = "buffer" },
		}),
	})

	-- Set configuration for specific filetype.
	cmp.setup.filetype("gitcommit", {
		sources = cmp.config.sources({
			{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
		}, {
			{ name = "buffer" },
		}),
	})

	local devicons = require("nvim-web-devicons")
	cmp.register_source("devicons", {
		complete = function(self, params, callback)
			local items = {}
			for _, icon in pairs(devicons.get_icons()) do
				table.insert(items, {
					label = icon.icon .. "  " .. icon.name,
					insertText = icon.icon,
					filterText = icon.name,
				})
			end
			callback({ items = items })
		end,
	})

	-- Set up lspconfig.
	capabilities = require("cmp_nvim_lsp").default_capabilities()
end

if isModuleAvailable("nvim-treesitter") then
	require("nvim-treesitter.configs").setup({
		ensure_installed = { "rust", "typescript", "tsx", "lua", "elm", "css", "scss", "prql", "sql", "svelte" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		ignore_install = {}, -- List of parsers to ignore installing
		indent = {
			enable = true,
		},
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
		},
		hl = { bg = "oceanblue" },
		textobjects = {
			move = {
				enable = true,
				set_jumps = false,
				goto_next_start = {
					["]p"] = "@parameter.inner",
				},
				goto_previous_start = {
					["[p"] = "@parameter.inner",
				},
			},
		},
	})
end

if isModuleAvailable("lsp_signature") then
	require("lsp_signature").setup()
end

local attach_opts = { noremap = true, silent = true }

local on_attach_lsp = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.signature_help()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "I", "<cmd>lua vim.lsp.buf.hover()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wa",
		"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
		attach_opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wr",
		"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
		attach_opts
	)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"<leader>wl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
		attach_opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>d", "<cmd>lua vim.lsp.buf.type_definition()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "R", "<cmd>lua vim.lsp.buf.rename()<CR>", attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "C", "<cmd>lua vim.lsp.buf.code_action()<CR>", attach_opts)

	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', attach_opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", attach_opts)

	-- prevent tsserver and denols competeing
	local active_clients = vim.lsp.get_active_clients()
	if client.name == "denols" then
		for _, client_ in pairs(active_clients) do
			-- stop tsserver if denols is already active
			if client_.name == "tsserver" then
				client_.stop()
			end
		end
	elseif client.name == "tsserver" then
		for _, client_ in pairs(active_clients) do
			-- prevent tsserver from starting if denols is already active
			if client_.name == "denols" then
				client.stop()
			end
		end
	end
end

if isModuleAvailable("rust-tools") then
	local opts = {
		tools = { -- rust-tools options
			on_initialized = function()
				require("rust-tools").inlay_hints.enable()
			end,
			inlay_hints = {
				-- Automatically set inlay hints (type hints)
				auto = true,

				-- Only show inlay hints for the current line
				only_current_line = false,

				-- whether to show parameter hints with the inlay hints or not
				-- default: true
				show_parameter_hints = true,

				-- prefix for parameter hints
				-- default: "<-"
				parameter_hints_prefix = "ℹ ",

				-- prefix for all the other hints (type, chaining)
				-- default: "=>"
				-- "->"
				-- "›"
				other_hints_prefix = "› ",

				-- whether to align to the lenght of the longest line in the file
				max_len_align = false,

				-- padding from the left if max_len_align is true
				max_len_align_padding = 1,

				-- whether to align to the extreme right or not
				right_align = false,

				-- padding from the right if right_align is true
				right_align_padding = 7,

				-- The color of the hints
				highlight = "RustHints",
			},
			-- how to execute terminal commands
			-- options right now: termopen / quickfix
			executor = require("rust-tools/executors").termopen,

			runnables = {
				-- whether to use telescope for selection menu or not
				use_telescope = false,

				-- rest of the opts are forwarded to telescope
			},

			debuggables = {
				-- whether to use telescope for selection menu or not
				use_telescope = false,

				-- rest of the opts are forwarded to telescope
			},

			hover_actions = {
				-- the border that is used for the hover window
				-- see vim.api.nvim_open_win()
				border = {
					{ "╭", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╮", "FloatBorder" },
					{ "│", "FloatBorder" },
					{ "╯", "FloatBorder" },
					{ "─", "FloatBorder" },
					{ "╰", "FloatBorder" },
					{ "│", "FloatBorder" },
				},

				-- whether the hover action window gets automatically focused
				auto_focus = false,
			},

			-- settings for showing the crate graph based on graphviz and the dot
			-- command
			crate_graph = {
				-- Backend used for displaying the graph
				-- see: https://graphviz.org/docs/outputs/
				-- default: x11
				backend = "x11",
				-- where to store the output, nil for no output stored (relative
				-- path from pwd)
				-- default: nil
				output = nil,
				-- true for all crates.io and external crates, false only the local
				-- crates
				-- default: true
				full = true,
			},
		},

		-- all the opts to send to nvim-lspconfig
		-- these override the defaults set by rust-tools.nvim
		-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
		server = {
			standalone = false,
			root_dir = nvim_lsp.util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					cargo = {
						buildScripts = {
							enable = true,
						},
						loadOutDirsFromCheck = true,
					},
					checkOnSave = {
						command = "clippy",
					},
					diagnostics = {
						enable = true,
						enableExperimental = false,
						disabled = { "unresolved-proc-macro" },
					},
					procMacro = {
						enable = true,
					},
				},
			},
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach_lsp(client, bufnr)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>RustHoverActions<CR>", attach_opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "gb", "<cmd>RustParentModule<CR>", attach_opts)
			end,
		}, -- rust-analyzer options

		-- debugging stuff
		dap = {},
	}

	require("rust-tools").setup(opts)
end

-- Neovide settings
vim.g.neovide_refresh_rate = 240
vim.g.neovide_remember_window_size = true
vim.g.neovide_cursor_vfx_mode = "pixiedust"
vim.o.guifont = "Fira Code:h13"

-- Floating terminal (floaterm)
vim.g.floaterm_opener = "edit"
vim.g.floaterm_borderchars = "─│─│╭╮╯╰"
vim.g.floaterm_title = ":::::T3RM1NAL::::: ($1|$2)"

--Incremental live completion
vim.o.inccommand = "nosplit"

--Set highlight on search
vim.o.hlsearch = true
vim.o.incsearch = true

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

-- Language settings
vim.g.lsp_cxx_hl_light_bg = 1
vim.g.cpp_class_scope_highlight = 1
vim.g.cpp_member_variable_highlight = 1
vim.g.cpp_class_decl_highlight = 1

vim.cmd([[set shortmess+=WFo]])
vim.cmd([[set nomore]])

--Save undo history
vim.cmd([[set undofile]])

--clipboard
vim.cmd([[set clipboard=unnamed,unnamedplus]])

vim.cmd([[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]])

-- enable syntastic
vim.cmd([[
  let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
]])

vim.cmd([[
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= '' . (i + 1) . '｜󱃖 ' . '%{MyTabLabel(' . (i + 1) . ')}  '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return fnamemodify(bufname(buflist[winnr - 1]), ":t")
endfunction

set tabline=%!MyTabLine()
]])

--misc

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--Remap space as leader key
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- My custom binds
vim.api.nvim_set_keymap("i", "<c-l>", "<Esc>la", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-h>", "<Esc>ha", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-j>", "<Esc>o", { noremap = true })
vim.api.nvim_set_keymap("i", "<c-k>", "<Esc>ko", { noremap = true })

vim.api.nvim_set_keymap("n", "0", "^", { noremap = true })
vim.api.nvim_set_keymap("n", "^", "0", { noremap = true })
vim.api.nvim_set_keymap("n", "-", "$", { noremap = true })

vim.api.nvim_set_keymap("n", "zm", "zz", { noremap = true })
vim.api.nvim_set_keymap("n", "zz", "zt7k7j", { noremap = true })
vim.api.nvim_set_keymap("n", "zb", "zb7j7k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-d>", "4j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-u>", "4k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-o>", "<C-o>zz", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-i>", "<C-i>zz", { noremap = true })

vim.api.nvim_set_keymap("n", "<leader>k", ":noh<return><esc>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", ":e $MYVIMRC<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", ":q<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>s", ":w<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>1", ":tabn1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>2", ":tabn2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>3", ":tabn3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>4", ":tabn4<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>5", ":tabn5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>6", ":tabn6<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>7", ":tabn7<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>8", ":tabn8<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>9", ":tabn9<CR>", { noremap = true })

-- Copy, delete, cut, paste FIXED :D
vim.api.nvim_set_keymap("n", "y", '"0y', { noremap = true })
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })
vim.api.nvim_set_keymap("n", "p", "p`[v`]=<C-i>", { noremap = true })
vim.api.nvim_set_keymap("n", "P", "P`[v`]=<C-i>", { noremap = true })
vim.api.nvim_set_keymap("x", "p", "pgv\"@=v:register.'y'<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("v", "p", '"0p', { noremap = true })
-- vim.api.nvim_set_keymap("v", "P", '"0P', { noremap = true })
vim.api.nvim_set_keymap("n", "x", '"_x', { noremap = true })
vim.api.nvim_set_keymap("n", "X", '"_X', { noremap = true })
vim.api.nvim_set_keymap("n", "c", '"_c', { noremap = true })
-- vim.api.nvim_set_keymap('n', 'C', '"_C', {noremap = true})
vim.api.nvim_set_keymap("n", "d", '"_d', { noremap = true })
vim.api.nvim_set_keymap("n", "D", '"_D', { noremap = true })
vim.api.nvim_set_keymap("n", "dw", '"_dw', { noremap = true })
vim.api.nvim_set_keymap("v", "dw", '"_dw', { noremap = true })
vim.api.nvim_set_keymap("n", "Dw", '"_Dw', { noremap = true })
vim.api.nvim_set_keymap("n", "diw", '"_diw', { noremap = true })
vim.api.nvim_set_keymap("v", "diw", '"_diw', { noremap = true })
vim.api.nvim_set_keymap("n", "Diw", '"_Diw', { noremap = true })
vim.api.nvim_set_keymap("n", "ciw", '"_ciw', { noremap = true })
vim.api.nvim_set_keymap("v", "ciw", '"_ciw', { noremap = true })
vim.api.nvim_set_keymap("n", "Ciw", '"_Ciw', { noremap = true })

--Add map to enter paste mode
vim.o.pastetoggle = "<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_char_highlight = "Whitespace"

if isModuleAvailable("treesitter-context") then
	require("treesitter-context").setup({
		mode = "cursor",
		separator = "/",
		max_lines = 5,
		trim_scope = "outer",
	})
end

-- if isModuleAvailable("notify") then
-- 	-- Overriding vim.notify with fancy notify if fancy notify exists
-- 	local notify = require("notify")
-- 	notify.setup({
-- 		background_colour = "#000000",
-- 	})

-- 	if not old_print then
-- 		old_print = _G.print
-- 	end

-- 	vim.notify = function(msg, level, opts)
-- 		old_print(tostring(level) .. ": " .. msg .. " : " .. vim.inspect(opts))
-- 		notify(msg, level, opts)
-- 	end

-- 	print = function(...)
-- 		local print_safe_args = {}
-- 		local _ = { ... }
-- 		for i = 1, #_ do
-- 			table.insert(print_safe_args, tostring(_[i]))
-- 		end
-- 		vim.notify(table.concat(print_safe_args, " "), "info")
-- 	end

-- 	vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
-- 		local client = vim.lsp.get_client_by_id(ctx.client_id)
-- 		local lvl = ({
-- 			"ERROR",
-- 			"WARN",
-- 			"INFO",
-- 			"DEBUG",
-- 		})[result.type]
-- 		notify({ result.message }, lvl, {
-- 			title = "LSP | " .. client.name,
-- 			timeout = 10000,
-- 			keep = function()
-- 				return lvl == "ERROR" or lvl == "WARN"
-- 			end,
-- 		})
-- 	end
-- end
-- vim.api.nvim_set_keymap(
-- 	"",
-- 	"<Esc>",
-- 	"<ESC>:noh<CR>:lua require('notify').dismiss()<CR>",
-- 	{ noremap = true, silent = true }
-- )

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
	if vim.o.mouse == "a" then
		vim.cmd([[IndentBlanklineDisable]])
		vim.wo.signcolumn = "no"
		vim.o.mouse = "v"
		vim.wo.number = false
	else
		vim.cmd([[IndentBlanklineEnable]])
		vim.wo.signcolumn = "yes"
		vim.o.mouse = "a"
		vim.wo.number = true
	end
end

vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua ToggleMouse()<cr>", { noremap = true })

-- local telescope_custom = require 'telescope-custom'

if isModuleAvailable("fzf-lua") then
	require("fzf-lua").setup({
		"fzf-native",
		winopts = {
			height = 1.0,
			width = 1.0,
			preview = {
				title = false,
				hidden = "nohidden",
				layout = "vertical",
				vertical = "up:30%",
				wrap = "wrap",
			},
		},
		hls = {
			preview_title = "IncSearch",
			search = "IncSearch",
			buf_linenr = "IncSearch",
			buf_name = "Normal",
		},
		file_icon_padding = " ",
		files = {
			prompt = "Files❯ ",
			multiprocess = true, -- run command in a separate process
			git_icons = true, -- show git icons?
			file_icons = true, -- show file icons?
			color_icons = true, -- colorize file|git icons
			find_opts = [[-type f -not  path '*/\.git/*' -printf '%P\n']],
			rg_opts = "--color=never --files --hidden --follow -g '!.git'",
			fd_opts = "--color=never --type f --hidden --follow --exclude .git",
		},
		previewers = {
			bat = {
				cmd = "bat",
				args = "--style=grid,numbers,changes --theme=GitHub --color=always",
				theme = vim.env.BAT_THEME,
				config = nil, -- nil uses $BAT_CONFIG_PATH
			},
		},
	})
	vim.api.nvim_set_hl(0, "FzfLuaTabTitle", { link = "Normal" })
	vim.api.nvim_set_hl(0, "FzfLuaBufName", { link = "Normal" })
	vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { link = "Normal" })
	vim.api.nvim_set_hl(0, "FzfLuaHeaderBind", { link = "Normal" })
	vim.api.nvim_set_hl(0, "FzfLuaBufNr", { link = "Normal" })
	vim.api.nvim_set_hl(0, "FzfLuaBufLineNr", { link = "Normal" })
end

if isModuleAvailable("wilder") then
	local gradient = {
		"#f4468f",
		"#fd4a85",
		"#ff507a",
		"#ff566f",
		"#ff5e63",
		"#ff6658",
		"#ff704e",
		"#ff7a45",
		"#ff843d",
		"#ff9036",
		"#f89b31",
		"#efa72f",
		"#e6b32e",
		"#dcbe30",
		"#d2c934",
		"#c8d43a",
		"#bfde43",
		"#b6e84e",
		"#aff05b",
	}

	local wilder = require("wilder")
	wilder.setup({ modes = { ":", "/", "?" } })

	for i, fg in ipairs(gradient) do
		gradient[i] = wilder.make_hl("WilderGradient" .. i, "Default", { { a = 1 }, { a = 1 }, { foreground = fg } })
	end
	wilder.set_option(
		"renderer",
		wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
			highlights = {
				default = "Normal",
				gradient = gradient,
				border = "Normal", -- highlight to use for the border
			},
			highlighter = wilder.highlighter_with_gradient({
				wilder.basic_highlighter(), -- or wilder.lua_fzy_highlighter(),
			}),
			left = { " ", wilder.popupmenu_devicons() },
			right = { " ", wilder.popupmenu_scrollbar() },
			-- 'single', 'double', 'rounded' or 'solid'
			-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
			border = "rounded",
		}))
	)
end

-- Telescope
-- if isModuleAvailable('telescope') then
--   local file_browser_actions = require 'telescope'.extensions.file_browser.actions
--   local telescope_actions = require("telescope.actions")
--   require('telescope').setup {
--     defaults = {
--       prompt_prefix = ' ❯ ',
--       selection_caret = '❯ ',
--       mappings = {
--         i = {
--           ["<C-o>"] = false,
--           ["<C-u>"] = false,
--           ["<C-d>"] = false,
--           ["<esc>"] = telescope_actions.close,
--           ['<c-j>'] = telescope_actions.move_selection_next,
--           ['<c-k>'] = telescope_actions.move_selection_previous,
--           -- ['<c-p>'] = telescope_actions.cycle_history_prev,
--           -- ['<c-n>'] = telescope_actions.cycle_history_next,
--         },
--       },
--       file_ignore_patterns = { "node_modules", ".git", "dist", "model.json" },
--       layout_strategy = "vertical",
--       layout_config = {
--         horizontal = {
--           preview_cutoff = 0,
--           mirror = false,
--         },
--         vertical = {
--           preview_cutoff = 0,
--           mirror = false,
--         },
--       },
--       generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
--       file_sorter =  require'telescope.sorters'.get_fzy_sorter,
--     },
--     extensions = {
--       file_browser = {
--         theme = 'ivy',
--         -- disables netrw and use telescope-file-browser in its place
--         hijack_netrw = false,
--         grouped = true,
--         respect_gitignore = true,
--         select_buffer = true,
--         hide_parent_dir = true,
--         mappings = {
--           ['i'] = {
--             ['<C-o>'] = file_browser_actions.goto_parent_dir,
--             ['<C-h>'] = file_browser_actions.goto_parent_dir,
--             ['<enter>'] = telescope_actions.select_default,
--             ['<C-l>'] = telescope_actions.select_default,
--             ['<C-r>'] = file_browser_actions.rename,
--             ['<C-a>'] = file_browser_actions.create,
--             ['<C-m>'] = file_browser_actions.move,
--             ['<C-d>'] = file_browser_actions.remove,
--             -- your custom insert mode mappings
--           },
--           ['n'] = {
--             -- your custom normal mode mappings
--           },
--         },
--       },
--     },
--     pickers = {
--       oldfiles = {
--         sort_lastused = true,
--         cwd_only = true,
--       },
--       live_grep = {
--         path_display = { 'shorten' },
--         mappings = {
--           i = {
--             ['<c-f>'] = telescope_custom.actions.set_extension,
--             ['<c-l>'] = telescope_custom.actions.set_folders,
--           },
--         },
--       },
--     },
--   }

--   -- To get telescope-file-browser loaded and working with telescope,
--   -- you need to call load_extension, somewhere after setup function:
--   require("telescope").load_extension "file_browser"
-- end

if isModuleAvailable("feline") then
	-- require('feline').setup()
	-- -- Theme table
	-- local my_theme = {
	--   red = '#ffffff',
	--   magenta = '#ffffff',
	--   orange = '#ffffff',
	--   green = '#ffffff',
	--   yellow = '#ffffff',
	--   blue = '#000005',
	--   skyblue='#000005',
	--   oceanblue='#000005',
	--   cyan='#000005',
	--   violet='#000005',
	--   bg='#000005',
	--   fg='#ffffff',
	-- }
	-- require('feline').use_theme(my_theme)
end

-- gitsigns
if isModuleAvailable("gitsigns") then
	require("gitsigns").setup({
		signs = {
			add = { hl = "GitSignsAdd", text = "+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
			change = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
			delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
		numhl = false,
		linehl = false,
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		current_line_blame = false,
		current_line_blame_opts = {
			delay = 1000,
			virt_text_pos = "eol",
		},
		diff_opts = {
			internal = false, -- If luajit is present (false for windows)
		},
		sign_priority = 6,
		update_debounce = 100,
		status_formatter = nil, -- Use default
		word_diff = false,
		on_attach = function()
			vim.api.nvim_set_keymap("n", "gn", '<cmd>silent lua require"gitsigns.actions".next_hunk()<CR>', attach_opts)
			vim.api.nvim_set_keymap("n", "gp", '<cmd>silent lua require"gitsigns.actions".prev_hunk()<CR>', attach_opts)
			vim.api.nvim_set_keymap("n", "<leader>gs", '<cmd>lua require"gitsigns".stage_hunk()<CR>', attach_opts)
			vim.api.nvim_set_keymap("n", "<leader>gu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', attach_opts)
			vim.api.nvim_set_keymap("n", "<leader>gr", '<cmd>lua require"gitsigns".reset_hunk()<CR>', attach_opts)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>gr",
				'<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
				attach_opts
			)
			vim.api.nvim_set_keymap("n", "<leader>gR", '<cmd>lua require"gitsigns".reset_buffer()<CR>', attach_opts)
			vim.api.nvim_set_keymap("n", "<leader>gp", '<cmd>lua require"gitsigns".preview_hunk()<CR>', attach_opts)
			vim.api.nvim_set_keymap("n", "<leader>gi", '<cmd>lua require"gitsigns".blame_line(true)<CR>', attach_opts)
		end,
	})
end

--Navigation shortcuts
-- vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Telescope file_browser path=%:p:h<cr>', { noremap = true })
-- map('n', '<leader>l', [[<cmd>vsplit<cr><C-w>l]])
-- map('n', '<leader>j', [[<cmd>split<cr><C-w>j]])
map("n", "<leader>o", "<cmd>Oil<cr>")
map("n", "<leader>gf", [[<cmd>silent !open %:h<cr>]])
map("n", "<leader>j", [[<cmd>FzfLua lsp_document_symbols<cr>]])
map("n", "<leader>l", [[<cmd>FzfLua lsp_references<cr>]])
map("n", "<leader>f", [[<cmd>FzfLua live_grep<cr>]])
map("n", "<leader>F", [[<cmd>FzfLua grep_cword<cr>]])
map("n", "<leader>h", [[<cmd>FzfLua buffers<cr>]])
map("v", "<leader>f", [[<cmd>FzfLua grep_visual<cr>]])
map("n", "<leader><leader>", [[<cmd>FzfLua files<cr>]])
map("n", "<leader>gg", [[<cmd>FzfLua git_status<cr>]])
map("n", "<leader>n", [[<cmd>FzfLua resume<cr>]])
map("n", "<leader>i", [[<cmd>FzfLua changes<cr>]])
map("n", "<leader>e", [[<cmd>FzfLua lsp_document_diagnostics<cr>]])

-- Change preview window location
vim.g.splitbelow = true
vim.g.splitright = true

-- Tabs
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.breakindent = true
vim.o.breakindent = true
vim.cmd([[set showbreak=ꜜ··]])
vim.cmd([[set list]])
vim.cmd([[set listchars=tab:▸·,trail:·,precedes:‹]])
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set cinoptions=+0]])
vim.cmd([[set wildignore+=*/node_modules/,.git,.git/*,node_modules/*,node_modules,.DS_Store,model.json]])
vim.cmd([[set nobackup]])
vim.cmd([[set linebreak]])
vim.cmd([[set noswapfile]])
vim.cmd([[set autowriteall]])
vim.cmd([[set autoread]])
vim.cmd([[set switchbuf=usetab,newtab]])
vim.cmd([[set noautochdir]])

-- STATUS LINE =============================================================================================

vim.cmd([[set fillchars=stl:⁖,stlnc:\ ]])
-- vim.cmd([[set fillchars=stl:፨,stlnc:\ ]])

function get_file_info()
	-- local icon = "  "
	local icon = " 󱀽 "
	local filename = (vim.fn.expand("%") == "" and "Empty ") or vim.fn.expand("%:t")
	local foldername = (vim.fn.expand("%:p:h") == "" and "Empty") or vim.fn.expand("%:p:h:t")

	local modified_indicator = ""
	if vim.bo.modified then
		modified_indicator = " "
	end

	if filename ~= "Empty " then
		local devicons_present, devicons = pcall(require, "nvim-web-devicons")

		if devicons_present then
			local ft_icon = devicons.get_icon(filename)
			icon = (ft_icon ~= nil and " " .. ft_icon) or ""
		end

		filename = " " .. foldername .. " -> " .. filename .. modified_indicator .. " "
	end

	return icon .. filename
end

-- statusline
local git_branch = function()
	if vim.g.loaded_fugitive then
		local branch = vim.fn.FugitiveHead()
		if branch ~= "" then
			return "  " .. branch
		end
	end
	return ""
end

local file_path = function()
	local buf_name = vim.api.nvim_buf_get_name(0)
	if buf_name == "" then
		return "[No Name]"
	end
	local home = vim.env.HOME
	local is_term = false
	local file_dir = ""

	if buf_name:sub(1, 5):find("term") ~= nil then
		file_dir = vim.env.PWD
		is_term = true
	else
		file_dir = vim.fn.expand("%:p:h")
	end

	if file_dir:find(home, 0, true) ~= nil then
		file_dir = file_dir:gsub(home, "~", 1)
	end

	if vim.api.nvim_win_get_width(0) <= 80 then
		file_dir = vim.fn.pathshorten(file_dir)
	end

	if is_term then
		return file_dir
	else
		return string.format("%s/%s", file_dir, vim.fn.expand("%:t"))
	end
end

local word_count = function()
	if vim.fn.wordcount().visual_words ~= nil then
		return vim.fn.wordcount().visual_words
	else
		return vim.fn.wordcount().words
	end
end

local modes = setmetatable({
	["n"] = { "NORMAL", "N" },
	["no"] = { "N·OPERATOR", "N·P" },
	["v"] = { "VISUAL", "V" },
	["V"] = { "V·LINE", "V·L" },
	[""] = { "V·BLOCK", "V·B" },
	[""] = { "V·BLOCK", "V·B" },
	["s"] = { "SELECT", "S" },
	["S"] = { "S·LINE", "S·L" },
	[""] = { "S·BLOCK", "S·B" },
	["i"] = { "INSERT", "I" },
	["ic"] = { "INSERT", "I" },
	["R"] = { "REPLACE", "R" },
	["Rv"] = { "V·REPLACE", "V·R" },
	["c"] = { "COMMAND", "C" },
	["cv"] = { "VIM·EX", "V·E" },
	["ce"] = { "EX", "E" },
	["r"] = { "PROMPT", "P" },
	["rm"] = { "MORE", "M" },
	["r?"] = { "CONFIRM", "C" },
	["!"] = { "SHELL", "S" },
	["t"] = { "TERMINAL", "T" },
}, {
	__index = function()
		return { "UNKNOWN", "U" } -- handle edge cases
	end,
})

local get_current_mode = function()
	local current_mode = vim.api.nvim_get_mode().mode
	if vim.api.nvim_win_get_width(0) <= 80 then
		return string.format("%s ", modes[current_mode][2])
	else
		return string.format("%s ", modes[current_mode][1])
	end
end

function status_line()
	return table.concat({
		get_current_mode(), -- get current mode
		git_branch(), -- branch name
		" %<", -- spacing
		get_file_info(), -- smart full path filename
		"%h%m%r%w", -- help flag, modified, readonly, and preview
		"%=", -- right align
		"   %{get(b:,'gitsigns_status','')}  ", -- gitsigns
		word_count(), -- word count
		"  %-3.(%l·%c", -- line number, column number
		"  %{strlen(&ft)?&ft[0].&ft[1:]:'None'}", -- file type
	})
end

vim.opt.statusline = "%!v:lua.status_line()"

-- STATUS LINE =============================================================================================

vim.cmd([[set noshowmode]])
vim.cmd([[set noruler]])
vim.cmd([[set cmdheight=0]])
vim.cmd([[set laststatus=3]])
vim.cmd([[set noshowcmd]])

vim.cmd([[set ff=unix]])

-- Highlight on yank
vim.api.nvim_exec(
	[[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]],
	false
)

-- Y yank until the end of line
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true })

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noinsert"

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
-- 	if vim.fn.pumvisible() == 1 then
-- 		return t("<C-n>")
-- 	elseif check_back_space() then
-- 		return t("<Tab>")
-- 	else
-- 		return vim.fn["compe#complete"]()
-- 	end
-- end
-- _G.s_tab_complete = function()
-- 	if vim.fn.pumvisible() == 1 then
-- 		return t("<C-p>")
-- 	else
-- 		return t("<S-Tab>")
-- 	end
-- end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

-- LSP settings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Enable underline, use default values
	underline = true,
	-- Enable virtual text only on Warning or above, override spacing to 2
	virtual_text = {
		spacing = 2,
		severity_limit = "Warning",
	},
})

-- enable C++
nvim_lsp.ccls.setup({
	capabilities = capabilities,
	init_options = {
		highlight = {
			lsRanges = true,
		},
	},
})

-- enable yaml
-- if isModuleAvailable("yaml-companion") then
--   local yaml_cfg = require("yaml-companion").setup({
--     -- Add any options here, or leave empty to use the default settings
--     lspconfig = {
--       on_attach = on_attach_lsp,
--     },
--   })
--   nvim_lsp.yamlls.setup(yaml_cfg)
-- end

-- svelte
nvim_lsp.svelte.setup({
	capabilities = capabilities,
	on_attach = on_attach_lsp,
})

-- css
nvim_lsp.cssls.setup({
	capabilities = capabilities,
	on_attach = on_attach_lsp,
	cmd = { "vscode-css-language-server", "--stdio" },
	settings = {
		scss = {
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
})

-- html
nvim_lsp.html.setup({
	capabilities = capabilities,
	on_attach = on_attach_lsp,
})

-- json
nvim_lsp.jsonls.setup({
	capabilities = capabilities,
	on_attach = on_attach_lsp,
})

-- unocss
nvim_lsp.unocss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "js", "jsx", "ts", "tsx", "javascript", "typescript", "typescriptreact", "javascriptreact" },
	root_dir = function(fname)
		return require("lspconfig.util").root_pattern("package.json")(fname)
	end,
})

--css colorizer
if isModuleAvailable("colorizer") then
	require("colorizer").setup()
end

-- Completion Icons
require("vim.lsp.protocol").CompletionItemKind = {
	"", -- Text
	"󰊕", -- Method
	"󰊕", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"", -- Interface
	"󰕳", -- Module
	"", -- Property
	"", -- Unit
	"#", -- Value
	"", -- Enum
	"", -- Keyword
	"", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"ℇ", -- Constant
	"", -- Struct
	"", -- Event
	"", -- Operator
	"󰛦", -- TypeParameter
}

if isModuleAvailable("conform") then
	require("conform").setup({
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettier" } },
			typescript = { { "prettier" } },
			typescriptreact = { { "prettier" } },
			css = { { "prettier" } },
			scss = { { "prettier" } },
			html = { { "prettier" } },
			json = { { "prettier" } },
			jaml = { { "prettier" } },
		},
		notify_on_error = false,
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 4000,
			lsp_fallback = true,
		},
		format_after_save = {
			lsp_fallback = false,
		},
	})
end

nvim_lsp.denols.setup({
	capabilities = capabilities,
	on_attach = on_attach_lsp,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})

nvim_lsp.graphql.setup({
	capabilities = capabilities,
})

nvim_lsp.prismals.setup({
	capabilities = capabilities,
})

-- Typescript
-- nvim_lsp.tsserver.setup({
-- 	on_attach = function(client, bufnr)
-- 		-- disable tsserver formatting if you plan on formatting via null-ls
-- 		client.server_capabilities.documentFormattingProvider = false
-- 		client.server_capabilities.documentRangeFormattingProvider = false

-- 		on_attach_lsp(client, bufnr)

-- 		if client.server_capabilities.documentHighlight then
-- 			vim.cmd([[
--       hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
--       hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
--       hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
--       ]])
-- 			vim.api.nvim_create_augroup("lsp_document_highlight", {
-- 				clear = false,
-- 			})
-- 			vim.api.nvim_clear_autocmds({
-- 				buffer = bufnr,
-- 				group = "lsp_document_highlight",
-- 			})
-- 			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
-- 				group = "lsp_document_highlight",
-- 				buffer = bufnr,
-- 				callback = vim.lsp.buf.document_highlight,
-- 			})
-- 			vim.api.nvim_create_autocmd("CursorMoved", {
-- 				group = "lsp_document_highlight",
-- 				buffer = bufnr,
-- 				callback = vim.lsp.buf.clear_references,
-- 			})
-- 		end

-- 		-- no default maps, so you may want to define some here
-- 		local opts = { silent = true }
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", ":TSLspOrganize<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", ":TSLspRenameFile<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TSLspImportAll<CR>", opts)
-- 	end,
-- 	root_dir = nvim_lsp.util.root_pattern("package.json"),
-- 	single_file_support = false,
-- })

if isModuleAvailable("typescript-tools") then
	require("typescript-tools").setup({
		capabilities = capabilities,
		on_attach = function(client, bufnr)
			-- disable tsserver formatting if you plan on formatting via null-ls
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			on_attach_lsp(client, bufnr)

			if client.server_capabilities.documentHighlight then
				vim.cmd([[
      hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      ]])
				vim.api.nvim_create_augroup("lsp_document_highlight", {
					clear = false,
				})
				vim.api.nvim_clear_autocmds({
					buffer = bufnr,
					group = "lsp_document_highlight",
				})
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					group = "lsp_document_highlight",
					buffer = bufnr,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd("CursorMoved", {
					group = "lsp_document_highlight",
					buffer = bufnr,
					callback = vim.lsp.buf.clear_references,
				})
			end

			-- no default maps, so you may want to define some here
			local opts = { silent = true }
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>co", ":TSLspOrganize<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", ":TSLspRenameFile<CR>", opts)
			vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ci", ":TSLspImportAll<CR>", opts)
		end,
		settings = {
			-- spawn additional tsserver instance to calculate diagnostics on it
			separate_diagnostic_server = true,
			-- "change"|"insert_leave" determine when the client asks the server about diagnostic
			publish_diagnostic_on = "insert_leave",
			-- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
			-- "remove_unused_imports"|"organize_imports") -- or string "all"
			-- to include all supported code actions
			-- specify commands exposed as code_actions
			expose_as_code_action = {},
			-- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
			-- not exists then standard path resolution strategy is applied
			tsserver_path = nil,
			-- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
			-- (see 💅 `styled-components` support section)
			tsserver_plugins = {},
			-- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
			-- memory limit in megabytes or "auto"(basically no limit)
			tsserver_max_memory = "auto",
			-- described below
			tsserver_format_options = {},
			tsserver_file_preferences = {},
			-- locale of all tsserver messages, supported locales you can find here:
			-- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
			tsserver_locale = "en",
			-- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
			complete_function_calls = false,
			include_completions_with_insert_text = true,
			-- CodeLens
			-- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
			-- possible values: ("off"|"all"|"implementations_only"|"references_only")
			code_lens = "off",
			-- by default code lenses are displayed on all referencable values and for some of you it can
			-- be too much this option reduce count of them by removing member references from lenses
			disable_member_code_lens = true,
			-- JSXCloseTag
			-- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-auto-tag,
			-- that maybe have a conflict if enable this feature. )
			jsx_close_tag = {
				enable = false,
				filetypes = { "javascriptreact", "typescriptreact" },
			},
		},
	})
end

-- type check entire project
if isModuleAvailable("tsc") then
	require("tsc").setup()
end

-- LSP border
local border = {
	{ "🭽", "FloatBorder" },
	{ "▔", "FloatBorder" },
	{ "🭾", "FloatBorder" },
	{ "▕", "FloatBorder" },
	{ "🭿", "FloatBorder" },
	{ "▁", "FloatBorder" },
	{ "🭼", "FloatBorder" },
	{ "▏", "FloatBorder" },
}
-- Override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

-- LSP Signs
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- LSP Symbol
vim.diagnostic.config({
	virtual_text = {
		prefix = "▎", -- Could be '●', '▎', 'x'
	},
})
