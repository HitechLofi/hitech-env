local theme = 'light'

-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

function isModuleAvailable(name)
  if package.loaded[name] then
    return true
  else
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(name)
      if type(loader) == 'function' then
        package.preload[name] = loader
        return true
      end
    end
    return false
  end
end

vim.api.nvim_exec([[
  augroup Packer
  autocmd!
  autocmd BufWritePost init.lua PackerCompile
  autocmd BufWritePre *.rs :Format
  augroup end
  autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'       -- Package manager
  use 'tpope/vim-fugitive'           -- Git commands in nvim
  use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines

  use 'folke/lsp-colors.nvim'

  use 'kyazdani42/nvim-web-devicons'
  use 'voldikss/vim-floaterm'

  use 'christoomey/vim-tmux-navigator' -- tmux
  use 'tmux-plugins/vim-tmux-focus-events' -- tmux

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update

  -- UI to select things (files, grep results, open buffers...)
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  use 'famiu/feline.nvim' -- fancy statusline
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'neovim/nvim-lspconfig'        -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-compe'           -- Autocompletion plugin

  use 'simrat39/rust-tools.nvim'
end)

SetTheme = function()
  if theme == 'dark' then
    vim.api.nvim_exec([[
    function UpdateDarkThemeColors()
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
      hi Comment guibg=NONE guifg=#7777aa gui=none
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
      highlight TrailingSpace guibg=#424242 guifg=#ffffff
      call matchadd('TrailingSpace', '\s\+$', 80)
    endfunction
    au VimEnter * call UpdateDarkThemeColors()
    ]], false)
  else
    vim.api.nvim_exec([[
    function UpdateLightThemeColors()
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
      hi TabLine guibg=none guifg=#aa88ee gui=bold
      hi TabLineSel guibg=#442288 guifg=#aa88ee gui=bold
      hi MatchParen guibg=#eeeeee guifg=#777777
      hi Search guibg=#FECB32 guifg=none gui=bold
      hi StatusLine guibg=none guifg=#777777
      hi StatusLineNC guibg=none guifg=#dddddd
      hi Comment guibg=NONE guifg=#aaaaaa gui=none
      hi SignColumn guibg=none
      hi CursorLineNr guibg=#123123
      hi CursorLine guibg=none guifg=#000000 gui=bold
      hi LineNr guibg=none guifg=#aaaaaa
      hi GitGutterAdd guibg=#baf49c guifg=#3a990a
      hi GitGutterChange guibg=#b5dafc guifg=#0CA8FC
      hi Whitespace guibg=none guifg=#eeeeee
      hi GitGutterDelete guibg=#f7b4be guifg=#e0081e
      hi GitGutterChangeDelete guibg=#b5dafc guifg=#0CA8FC
      highlight TrailingSpace guibg=#eeeeee guifg=#888888
      call matchadd('TrailingSpace', '\s\+$', 80)
    endfunction
    au VimEnter * call UpdateLightThemeColors()
    ]], false)
  end
  vim.api.nvim_exec([[
  function UpdateSharedThemeColors()
    hi Constant guibg=none guifg=#0CA8FC
    hi Group guibg=none
    hi Error guibg=#ed1b04 guifg=#ffe1dd
    hi Warning guibg=#ffe100 guifg=#1c1c1c
    hi FloatermBorder guibg=none guifg=#555555
    hi htmlArg gui=italic
  endfunction
  au VimEnter * call UpdateSharedThemeColors()
  ]], false)
end

SetTheme()

if isModuleAvailable('nvim-treesitter') then
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'rust', 'typescript', 'tsx', 'lua', 'elm' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {}, -- List of parsers to ignore installing
    indent = {
      enable = false
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {}, -- list of language that will be disabled
    },
    hl = {bg = 'oceanblue'},
  }
end

if isModuleAvailable('feline') then
  require('feline-config')
end

if isModuleAvailable('lsp-colors') then
  require('lsp-colors').setup({
    Error = '#db4b4b',
    Warning = '#e0af68',
    Information = '#0db9d7',
    Hint = '#10B981'
  })
end

if isModuleAvailable('rust-tools') then
  local opts = {
    tools = { -- rust-tools options
      -- automatically set inlay hints (type hints)
      -- There is an issue due to which the hints are not applied on the first
      -- opened file. For now, write to the file to trigger a reapplication of
      -- the hints or just run :RustSetInlayHints.
      -- default: true
      autoSetHints = true,
      -- whether to show hover actions inside the hover window
      -- this overrides the default hover handler
      -- default: true
      hover_with_actions = true,
      runnables = {
        -- whether to use telescope for selection menu or not
        -- default: true
        use_telescope = true
        -- rest of the opts are forwarded to telescope
      },
      debuggables = {
        -- whether to use telescope for selection menu or not
        use_telescope = true
        -- rest of the opts are forwarded to telescope
      },
      inlay_hints = {
        -- wheter to show parameter hints with the inlay hints or not
        -- default: true
        show_parameter_hints = true,
        -- prefix for parameter hints
        -- default: "<-"
        parameter_hints_prefix = "fn",
        -- prefix for all the other hints (type, chaining)
        -- default: "=>"
        other_hints_prefix  = "-> ",
        -- whether to align to the lenght of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
      },

      hover_actions = {
        -- the border that is used for the hover window
        -- see vim.api.nvim_open_win()
        border = {
          {"╭", "FloatBorder"}, {"─", "FloatBorder"},
          {"╮", "FloatBorder"}, {"│", "FloatBorder"},
          {"╯", "FloatBorder"}, {"─", "FloatBorder"},
          {"╰", "FloatBorder"}, {"│", "FloatBorder"}
        },
      }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
    server = {}, -- rust-analyer options
  }

  require('rust-tools').setup(opts)
end

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

--Save undo history
vim.cmd[[set undofile]]

--clipboard
vim.cmd[[set clipboard=unnamed,unnamedplus]]

--misc

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn="yes"

--Set colorscheme (order is important here)
vim.o.termguicolors = true

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent=true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap=true, expr = true, silent = true})
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", {noremap= true, expr = true, silent = true})

-- My custom binds
vim.api.nvim_set_keymap('i', '<c-l>', '<Esc>la', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-h>', '<Esc>ha', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-j>', '<Esc>o', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-k>', '<Esc>ko', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w><C-p>', {noremap = true})
vim.api.nvim_set_keymap('n', '0', '^', {noremap = true})
vim.api.nvim_set_keymap('n', '^', '0', {noremap = true})
vim.api.nvim_set_keymap('n', '-', '$', {noremap = true})

vim.api.nvim_set_keymap('n', 'zm', 'zz', {noremap = true})
vim.api.nvim_set_keymap('n', 'zz', 'zt4k4j', {noremap = true})
vim.api.nvim_set_keymap('n', 'zb', 'zb4j4k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-d>', '4j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-u>', '4k', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>k', ':noh<return><esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>p', ':e $MYVIMRC<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>1', ':tabn1<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>2', ':tabn2<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>3', ':tabn3<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>4', ':tabn4<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>5', ':tabn5<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>6', ':tabn6<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>7', ':tabn7<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>8', ':tabn8<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>9', ':tabn9<CR>', {noremap = true})

-- Copy, delete, cut, paste FIXED :D
vim.api.nvim_set_keymap('n', 'y', '"*y', {noremap = true})
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})
vim.api.nvim_set_keymap('n', 'p', 'p`[v`]=<C-i>', {noremap = true})
vim.api.nvim_set_keymap('n', 'P', 'P`[v`]=<C-i>', {noremap = true})
vim.api.nvim_set_keymap('x', 'p', 'pgv"@=v:register.\'y\'<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'x', '"_x', {noremap = true})
vim.api.nvim_set_keymap('n', 'X', '"_X', {noremap = true})
vim.api.nvim_set_keymap('n', 'c', '"_c', {noremap = true})
vim.api.nvim_set_keymap('n', 'C', '"_C', {noremap = true})
vim.api.nvim_set_keymap('n', 'd', '"_d', {noremap = true})
vim.api.nvim_set_keymap('n', 'D', '"_D', {noremap = true})
vim.api.nvim_set_keymap('n', 'dw', '"_dw', {noremap = true})
vim.api.nvim_set_keymap('v', 'dw', '"_dw', {noremap = true})
vim.api.nvim_set_keymap('n', 'Dw', '"_Dw', {noremap = true})
vim.api.nvim_set_keymap('n', 'diw', '"_diw', {noremap = true})
vim.api.nvim_set_keymap('v', 'diw', '"_diw', {noremap = true})
vim.api.nvim_set_keymap('n', 'Diw', '"_Diw', {noremap = true})
vim.api.nvim_set_keymap('n', 'ciw', '"_ciw', {noremap = true})
vim.api.nvim_set_keymap('v', 'ciw', '"_ciw', {noremap = true})
vim.api.nvim_set_keymap('n', 'Ciw', '"_Ciw', {noremap = true})

--Remap escape to leave terminal mode
-- vim.api.nvim_set_keymap('t', '<Esc>', [[<c-\><c-n>]], {noremap = true})

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'Whitespace'

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == 'a' then
    vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn='no'
    vim.o.mouse = 'v'
    vim.wo.number = false
  else
    vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn='yes'
    vim.o.mouse = 'a'
    vim.wo.number = true
  end
end

vim.api.nvim_set_keymap('n', '<F10>', '<cmd>lua ToggleMouse()<cr>', { noremap = true })

-- Telescope
if isModuleAvailable('telescope') then
  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
      layout_strategy = "vertical",
      layout_config = {
        horizontal = {
          mirror = false,
        },
        vertical = {
          mirror = false,
        },
      },
      generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
      file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    }
  }
end

-- gitsigns
if isModuleAvailable('gitsigns') then
  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = ' ', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = ' ', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    keymaps = {
      -- Default keymap options
      noremap = true,
      buffer = true,

      ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
      ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
      ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',

      -- Text objects
      ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
    watch_index = {
      interval = 1000,
      follow_files = true
    },
    current_line_blame = false,
    current_line_blame_delay = 1000,
    current_line_blame_position = 'eol',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    use_decoration_api = true,
    use_internal_diff = true,  -- If luajit is present
  }
end

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>FloatermNew --width=0.7 --height=0.9 broot<cr>]], { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gs', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gC', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})

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
vim.cmd[[set showbreak=ꜜ··]]
vim.cmd[[set list]]
vim.cmd[[set listchars=tab:▸·,trail:·]]
vim.cmd[[set iskeyword+=-]]
vim.cmd[[set cinoptions=+0]]
vim.cmd[[set wildignore+=*/node_modules/,.git,.git/*,node_modules/*,node_modules,.DS_Store]]
vim.cmd[[set nobackup]]
vim.cmd[[set linebreak]]
vim.cmd[[set noswapfile]]
vim.cmd[[set noshowmode]]
vim.cmd[[set autowriteall]]
vim.cmd[[set autoread]]
vim.cmd[[set switchbuf=usetab,newtab]]
vim.cmd[[set noautochdir]]

-- Highlight on yank
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})
--
-- LSP settings
local nvim_lsp = require('lspconfig')
local on_attach = function(_client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>i', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

-- Enable the following language servers
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

local sumneko_root_path = vim.fn.getenv("HOME").."/.local/bin/sumneko_lua" -- Change to your sumneko root installation
local sumneko_binary_path = "/bin/linux/lua-language-server" -- Change to your OS specific output folder
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_root_path .. sumneko_binary_path, "-E", sumneko_root_path.."/main.lua" };
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
}

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])

-- Set completeopt to have a better completion experience
vim.o.completeopt="menuone,noinsert"

-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})