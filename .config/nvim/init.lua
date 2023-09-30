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
  autocmd BufWritePre *.svelte :Format
  autocmd BufWritePre *.rs :Format
  autocmd BufWritePre *.ts :Format
  autocmd BufWritePre *.tsx :Format
  autocmd BufWritePre *.js :Format
  autocmd BufWritePre *.yml :Format
  autocmd BufWritePre *.json :Format
  augroup end
  autocmd FileType svelte setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType ts setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType tsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType swift autocmd BufWritePost *.swift :silent exec "!swiftformat %"
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'       -- Package manager
  use 'tpope/vim-fugitive'           -- Git commands in nvim
  use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary'         -- "gc" to comment visual regions/lines

  use 'nvim-lua/plenary.nvim'

  use 'kyazdani42/nvim-web-devicons'

  use {
    "someone-stole-my-name/yaml-companion.nvim",
    requires = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("telescope").load_extension("yaml_schema")
    end,
  }

  -- use 'christoomey/vim-tmux-navigator' -- tmux
  -- use 'tmux-plugins/vim-tmux-focus-events' -- tmux

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }  -- We recommend updating the parsers on update
  use 'nvim-treesitter/nvim-treesitter-context'

  use "folke/trouble.nvim"
  use "dmmulroy/tsc.nvim"

  use "folke/neodev.nvim"

  -- UI to select things (files, grep results, open buffers...)
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
  use 'neovim/nvim-lspconfig'        -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-compe'           -- Autocompletion plugin
  use 'ray-x/lsp_signature.nvim'

  use 'NvChad/nvim-colorizer.lua'

  use 'rcarriga/nvim-notify'
  -- use({
  --   "folke/noice.nvim",
  --   config = function()
  --     require("noice").setup()
  --   end,
  --   requires = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- })

  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  use 'simrat39/rust-tools.nvim'

  use 'jparise/vim-graphql'
  use 'prisma/vim-prisma'

  use 'jackguo380/vim-lsp-cxx-highlight'
  use 'tikhomirov/vim-glsl'

  use 'jonsmithers/vim-html-template-literals'

  use 'feline-nvim/feline.nvim'

  -- swift
  use 'vim-syntastic/syntastic'
  use 'keith/swift.vim'

end)

SetTheme = function()
  vim.api.nvim_exec([[
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
    hi MatchParen guibg=#eeeeee guifg=#777777
    hi Search guibg=#FECB32 guifg=none gui=bold
    hi StatusLine guibg=none guifg=#554477 gui=none
    hi StatusLineNC guibg=none guifg=#554477 gui=none
    hi Comment guibg=NONE guifg=#aaaaaa gui=italic cterm=italic
    hi RustHints guibg=#EAF9FF guifg=#006CAD gui=none
    hi SignColumn guibg=none
    hi CursorLineNr guibg=#123123
    hi CursorLine guibg=none guifg=#000000 gui=bold
    hi LineNr guibg=none guifg=#aaaaaa
    hi GitGutterAdd guibg=#baf49c guifg=#3a990a
    hi GitGutterChange guibg=#b5dafc guifg=#0CA8FC
    hi Whitespace guibg=none guifg=#eeeeee
    hi GitGutterDelete guibg=#f7b4be guifg=#e0081e
    hi GitGutterChangeDelete guibg=#b5dafc guifg=#0CA8FC
    hi TrailingSpace guibg=#eeeeee guifg=#888888
    hi EndOfBuffer guibg=none guifg=#ffffff

    hi CompeDocumentation guibg=#eeeeee guifg=#222222
    hi CompeDocumentationBorder guibg=#eeeeee guifg=#000000
    hi Pmenu guibg=#eeeeee guifg=#222222

    call matchadd('TrailingSpace', '\s\+$', 80)
    call SetSharedThemeColors()
  endfunction
  ]], false)

  if theme == 'dark' then
    vim.api.nvim_exec([[
      au VimEnter * call UseDarkThemeColors()
    ]], false)
  else
    vim.api.nvim_exec([[
      au VimEnter * call UseLightThemeColors()
    ]], false)
  end
end

SetTheme()

function map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    if type(rhs) == 'string' then
      vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    else
      opts.callback = rhs
      vim.api.nvim_set_keymap(mode, lhs, '', opts)
    end
  end
end

local nvim_lsp = require('lspconfig')

if isModuleAvailable('nvim-treesitter') then
  require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'rust', 'typescript', 'tsx', 'lua', 'elm', 'css', 'scss', 'prql', 'sql', 'svelte' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {}, -- List of parsers to ignore installing
    indent = {
      enable = true
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {}, -- list of language that will be disabled
    },
    hl = {bg = 'oceanblue'},
  }
end

local attach_opts = { noremap=true, silent=true }

local on_attach_lsp = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'I', '<cmd>lua vim.lsp.buf.hover()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>d', '<cmd>lua vim.lsp.buf.type_definition()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'R', '<cmd>lua vim.lsp.buf.rename()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'C', '<cmd>lua vim.lsp.buf.code_action()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<Cmd>TroubleToggle<cr>', attach_opts)


  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', attach_opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ge', '<cmd>lua vim.diagnostic.goto_next()<CR>', attach_opts)

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

if isModuleAvailable('rust-tools') then
  local opts = {
    tools = { -- rust-tools options
      on_initialized = function()
        require('rust-tools').inlay_hints.enable()
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
        use_telescope = true

        -- rest of the opts are forwarded to telescope
      },

      debuggables = {
        -- whether to use telescope for selection menu or not
        use_telescope = true

        -- rest of the opts are forwarded to telescope
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

        -- whether the hover action window gets automatically focused
        auto_focus = false
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
      }
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
      standalone = false,
      root_dir = nvim_lsp.util.root_pattern('Cargo.toml'),
      settings = {
        ["rust-analyzer"] = {
          cargo = {
            buildScripts = {
              enable = true,
            },
            loadOutDirsFromCheck = true
          },
          checkOnSave = {
            command = "clippy",
          },
          diagnostics = {
            enable = true,
            enableExperimental = false,
            disabled = {"unresolved-proc-macro"},
          },
          procMacro = {
            enable = true
          },
        },
      },
      on_attach = function(client, bufnr)
        on_attach_lsp(client, bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>RustHoverActions<CR>', attach_opts)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gb', '<cmd>RustParentModule<CR>', attach_opts)
      end,
    }, -- rust-analyzer options

    -- debugging stuff
    dap = {}
  }

  require('rust-tools').setup(opts)
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

vim.cmd[[set shortmess+=WFo]]
vim.cmd[[set nomore]]

--Save undo history
vim.cmd[[set undofile]]

--clipboard
vim.cmd[[set clipboard=unnamed,unnamedplus]]

vim.cmd[[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]

-- enable syntastic
vim.cmd[[
  let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
]]

vim.cmd[[
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
    let s .= '' . (i + 1) . '𐫵  ' . '%{MyTabLabel(' . (i + 1) . ')}  '
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
]]

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

vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], {noremap= true})

-- My custom binds
vim.api.nvim_set_keymap('i', '<c-l>', '<Esc>la', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-h>', '<Esc>ha', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-j>', '<Esc>o', {noremap = true})
vim.api.nvim_set_keymap('i', '<c-k>', '<Esc>ko', {noremap = true})

vim.api.nvim_set_keymap('n', '0', '^', {noremap = true})
vim.api.nvim_set_keymap('n', '^', '0', {noremap = true})
vim.api.nvim_set_keymap('n', '-', '$', {noremap = true})

vim.api.nvim_set_keymap('n', 'zm', 'zz', {noremap = true})
vim.api.nvim_set_keymap('n', 'zz', 'zt7k7j', {noremap = true})
vim.api.nvim_set_keymap('n', 'zb', 'zb7j7k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-d>', '4j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-u>', '4k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true})

vim.api.nvim_set_keymap('n', '<C-o>', '<C-o>zz', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-i>', '<C-i>zz', {noremap = true})

vim.api.nvim_set_keymap('n', '<leader>k', ':noh<return><esc>', {noremap = true, silent = true})
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
-- vim.api.nvim_set_keymap('n', 'C', '"_C', {noremap = true})
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

--Add map to enter paste mode
vim.o.pastetoggle="<F3>"

--Map blankline
vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'Whitespace'

if isModuleAvailable('treesitter-context') then
  require'treesitter-context'.setup{
    mode = 'cursor',
    separator = '/',
    max_lines = 5,
    trim_scope = 'outer'
  }
end

if isModuleAvailable('notify') then
  -- Overriding vim.notify with fancy notify if fancy notify exists
  local notify = require('notify')
  notify.setup({
    background_colour = "#000000",
  })

  if not old_print then
    old_print = _G.print
  end

  vim.notify = function(msg, level, opts)
    old_print(tostring(level) .. ": " .. msg .. " : " .. vim.inspect(opts))
    notify(msg, level, opts)
  end

  print = function(...)
    local print_safe_args = {}
    local _ = { ... }
    for i = 1, #_ do
      table.insert(print_safe_args, tostring(_[i]))
    end
    vim.notify(table.concat(print_safe_args, ' '), "info")
  end

  vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local lvl = ({
      'ERROR',
      'WARN',
      'INFO',
      'DEBUG',
    })[result.type]
    notify({ result.message }, lvl, {
      title = 'LSP | ' .. client.name,
      timeout = 10000,
      keep = function()
        return lvl == 'ERROR' or lvl == 'WARN'
      end,
    })
  end
end
vim.api.nvim_set_keymap('', '<Esc>', "<ESC>:noh<CR>:lua require('notify').dismiss()<CR>", { noremap = true, silent=true})

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

local telescope_custom = require 'telescope-custom'

-- Telescope
if isModuleAvailable('telescope') then
  local file_browser_actions = require 'telescope'.extensions.file_browser.actions
  local telescope_actions = require("telescope.actions")
  require('telescope').setup {
    defaults = {
      prompt_prefix = ' ❯ ',
      selection_caret = '❯ ',
      mappings = {
        i = {
          ["<C-o>"] = false,
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<esc>"] = telescope_actions.close,
          ['<c-j>'] = telescope_actions.move_selection_next,
          ['<c-k>'] = telescope_actions.move_selection_previous,
          -- ['<c-p>'] = telescope_actions.cycle_history_prev,
          -- ['<c-n>'] = telescope_actions.cycle_history_next,
        },
      },
      file_ignore_patterns = { "node_modules", ".git", "dist", "model.json" },
      layout_strategy = "vertical",
      layout_config = {
        horizontal = {
          preview_cutoff = 0,
          mirror = false,
        },
        vertical = {
          preview_cutoff = 0,
          mirror = false,
        },
      },
      generic_sorter =  require'telescope.sorters'.get_fzy_sorter,
      file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    },
    extensions = {
      file_browser = {
        theme = 'ivy',
        -- disables netrw and use telescope-file-browser in its place
        hijack_netrw = false,
        grouped = true,
        respect_gitignore = true,
        select_buffer = true,
        hide_parent_dir = true,
        mappings = {
          ['i'] = {
            ['<C-o>'] = file_browser_actions.goto_parent_dir,
            ['<C-h>'] = file_browser_actions.goto_parent_dir,
            ['<enter>'] = telescope_actions.select_default,
            ['<C-l>'] = telescope_actions.select_default,
            ['<C-r>'] = file_browser_actions.rename,
            ['<C-a>'] = file_browser_actions.create,
            ['<C-m>'] = file_browser_actions.move,
            ['<C-d>'] = file_browser_actions.remove,
            -- your custom insert mode mappings
          },
          ['n'] = {
            -- your custom normal mode mappings
          },
        },
      },
    },
    pickers = {
      oldfiles = {
        sort_lastused = true,
        cwd_only = true,
      },
      live_grep = {
        path_display = { 'shorten' },
        mappings = {
          i = {
            ['<c-f>'] = telescope_custom.actions.set_extension,
            ['<c-l>'] = telescope_custom.actions.set_folders,
          },
        },
      },
    },
  }

  -- To get telescope-file-browser loaded and working with telescope,
  -- you need to call load_extension, somewhere after setup function:
  require("telescope").load_extension "file_browser"
end

if isModuleAvailable('feline') then
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
if isModuleAvailable('gitsigns') then
  require('gitsigns').setup {
    signs = {
      add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
      changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    watch_gitdir = {
      interval = 1000,
      follow_files = true
    },
    current_line_blame = false,
    current_line_blame_opts = {
      delay = 1000,
      virt_text_pos = 'eol',
    },
    diff_opts = {
      internal = false  -- If luajit is present (false for windows)
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    word_diff = false,
    on_attach = function()
      vim.api.nvim_set_keymap('n', 'gn', '<cmd>silent lua require\"gitsigns.actions\".next_hunk()<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', 'gp', '<cmd>silent lua require\"gitsigns.actions\".prev_hunk()<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', '<leader>gs', '<cmd>lua require"gitsigns".stage_hunk()<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', '<leader>gu', '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', '<leader>gr', '<cmd>lua require"gitsigns".reset_hunk()<CR>', attach_opts)
      vim.api.nvim_set_keymap('v', '<leader>gr', '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', '<leader>gR', '<cmd>lua require"gitsigns".reset_buffer()<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', '<leader>gp', '<cmd>lua require"gitsigns".preview_hunk()<CR>', attach_opts)
      vim.api.nvim_set_keymap('n', '<leader>gi', '<cmd>lua require"gitsigns".blame_line(true)<CR>', attach_opts)
    end
  }
end

--Add leader shortcuts
vim.api.nvim_set_keymap('n', '<leader><leader>', [[<cmd>lua require('telescope.builtin').find_files()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>n', [[<cmd>lua require('telescope.builtin').resume()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('telescope.builtin').buffers()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>o', '<cmd>Telescope file_browser path=%:p:h<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>v', [[<cmd>lua require('telescope.builtin').oldfiles()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gf', [[<cmd>silent !open %:h<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>l', [[<cmd>vsplit<cr><C-w>l]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>j', [[<cmd>split<cr><C-w>j]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gc', [[<cmd>lua require('telescope.builtin').git_commits()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gb', [[<cmd>lua require('telescope.builtin').git_branches()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gg', [[<cmd>lua require('telescope.builtin').git_status()<cr>]], { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gC', [[<cmd>lua require('telescope.builtin').git_bcommits()<cr>]], { noremap = true, silent = true})
map('n', '<leader>f', telescope_custom.live_grep)

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
vim.cmd[[set listchars=tab:▸·,trail:·,precedes:‹]]
vim.cmd[[set iskeyword+=-]]
vim.cmd[[set cinoptions=+0]]
vim.cmd[[set wildignore+=*/node_modules/,.git,.git/*,node_modules/*,node_modules,.DS_Store,model.json]]
vim.cmd[[set nobackup]]
vim.cmd[[set linebreak]]
vim.cmd[[set noswapfile]]
vim.cmd[[set autowriteall]]
vim.cmd[[set autoread]]
vim.cmd[[set switchbuf=usetab,newtab]]
vim.cmd[[set noautochdir]]

-- STATUS LINE =============================================================================================

vim.cmd[[set fillchars=stl:⁖,stlnc:\ ]]

function get_file_info()
  local icon = "  "
  local filename = (vim.fn.expand "%" == "" and "Empty ") or vim.fn.expand "%:t"
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
    if branch ~= '' then return "  " .. branch end
  end
  return ''
end

local file_path = function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  if buf_name == "" then return "[No Name]" end
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
  ['n'] = {'NORMAL', 'N'},
  ['no'] = {'N·OPERATOR', 'N·P'},
  ['v'] = {'VISUAL', 'V'},
  ['V'] = {'V·LINE', 'V·L'},
  [''] = {'V·BLOCK', 'V·B'},
  [''] = {'V·BLOCK', 'V·B'},
  ['s'] = {'SELECT', 'S'},
  ['S'] = {'S·LINE', 'S·L'},
  [''] = {'S·BLOCK', 'S·B'},
  ['i'] = {'INSERT', 'I'},
  ['ic'] = {'INSERT', 'I'},
  ['R'] = {'REPLACE', 'R'},
  ['Rv'] = {'V·REPLACE', 'V·R'},
  ['c'] = {'COMMAND', 'C'},
  ['cv'] = {'VIM·EX', 'V·E'},
  ['ce'] = {'EX', 'E'},
  ['r'] = {'PROMPT', 'P'},
  ['rm'] = {'MORE', 'M'},
  ['r?'] = {'CONFIRM', 'C'},
  ['!'] = {'SHELL', 'S'},
  ['t'] = {'TERMINAL', 'T'}
}, {
    __index = function()
      return {'UNKNOWN', 'U'} -- handle edge cases
    end
  })

local get_current_mode = function()
  local current_mode = vim.api.nvim_get_mode().mode
  if vim.api.nvim_win_get_width(0) <= 80 then
    return string.format('%s ', modes[current_mode][2])
  else
    return string.format('%s ', modes[current_mode][1])
  end
end

function status_line()
  return table.concat {
    get_current_mode(), -- get current mode
    git_branch(), -- branch name
    " %<", -- spacing
    get_file_info(), -- smart full path filename
    "%h%m%r%w", -- help flag, modified, readonly, and preview
    "%=", -- right align
    "  %{get(b:,'gitsigns_status','')}  ", -- gitsigns
    word_count(), -- word count
    "  %-3.(%l·%c", -- line number, column number
    "  %{strlen(&ft)?&ft[0].&ft[1:]:'None'}" -- file type
  }
end

vim.opt.statusline = "%!v:lua.status_line()"

-- STATUS LINE =============================================================================================

vim.cmd[[set noshowmode]]
vim.cmd[[set noruler]]
vim.cmd[[set cmdheight=0]]
vim.cmd[[set laststatus=3]]
vim.cmd[[set noshowcmd]]

vim.cmd[[set ff=unix]]

-- Highlight on yank
vim.api.nvim_exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end
]], false)

-- Y yank until the end of line
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true})

-- Map :Format to vim.lsp.buf.formatting()
vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]])

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
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 80;
  max_kind_width = 80;
  max_menu_width = 80;
  documentation = {
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 80,
    min_width = 40,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };
  source = {
    path = true;
    buffer = false;
    tags = false;
    spell = false;
    calc = {menu = ''};
    nvim_lsp = {menu = '', priority = 10};
    nvim_lua = {menu = ''};
    treesitter = false;
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

-- LSP settings
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text only on Warning or above, override spacing to 2
    virtual_text = {
      spacing = 2,
      severity_limit = "Warning",
    },
  }
)

-- enable C++
nvim_lsp.ccls.setup {
  init_options = {
    highlight = {
      lsRanges = true;
    }
  }
}

-- enable yaml
if isModuleAvailable("yaml-companion") then
  local yaml_cfg = require("yaml-companion").setup({
    -- Add any options here, or leave empty to use the default settings
    lspconfig = {
      on_attach = on_attach_lsp,
    },
  })
  nvim_lsp.yamlls.setup(yaml_cfg)
end

-- svelte
nvim_lsp.svelte.setup {
  on_attach = on_attach_lsp
}

-- css
nvim_lsp.cssls.setup{
  on_attach = on_attach_lsp,
  cmd = { "vscode-css-language-server", "--stdio" },
  settings = {
    scss = {
      lint = {
         unknownAtRules = 'ignore'
      }
    }
  }
}

-- html
nvim_lsp.html.setup{
  on_attach = on_attach_lsp
}

-- json
nvim_lsp.jsonls.setup{
  on_attach = on_attach_lsp
}

-- unocss
nvim_lsp.unocss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "js", "jsx", "ts", "tsx", "javascript", "typescript", "typescriptreact", "javascriptreact" },
  root_dir = function(fname)
    return require 'lspconfig.util'.root_pattern("package.json")(fname)
  end
}

--css colorizer
if isModuleAvailable('colorizer') then
  require 'colorizer'.setup()
end

-- Completion Icons
require('vim.lsp.protocol').CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '了', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- enable null-ls integration (optional)
if isModuleAvailable('null-ls') then
  require("null-ls").setup({
      sources = {
        require("null-ls").builtins.formatting.prettier.with({
          filetypes = { "html", "json", "yaml", "js", "jsx", "ts", "tsx", "javascript", "typescript", "typescriptreact", "javascriptreact", "scss", "css" },
          prefer_local = "node_modules/.bin",
        }),
        require("null-ls").builtins.diagnostics.eslint.with({
          filetypes = { "html", "json", "js", "jsx", "ts", "tsx", "javascript", "typescript", "typescriptreact", "javascriptreact", "scss", "css" },
          prefer_local = "node_modules/.bin",
        }),
      },
  })
end

nvim_lsp.denols.setup {
  on_attach = on_attach_lsp,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")
}

nvim_lsp.graphql.setup{}

nvim_lsp.prismals.setup{}

-- Typescript
nvim_lsp.tsserver.setup {
  on_attach = function(client, bufnr)
    -- disable tsserver formatting if you plan on formatting via null-ls
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    on_attach_lsp(client, bufnr)

    local ts_utils = require("nvim-lsp-ts-utils")

    -- defaults
    ts_utils.setup {
      debug = false,
      disable_commands = false,
      enable_import_on_completion = false,

      -- import all
      import_all_timeout = 5000, -- ms
      import_all_priorities = {
        buffers = 4, -- loaded buffer names
        buffer_content = 3, -- loaded buffer content
        local_files = 2, -- git files or files with relative path markers
        same_file = 1, -- add to existing import statement
      },
      import_all_scan_buffers = 100,
      import_all_select_source = false,

      -- eslint
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint",
      eslint_enable_diagnostics = true,
      eslint_opts = {},

      -- formatting
      enable_formatting = true,
      formatter = "prettier",
      formatter_opts = {},

      -- update imports on file move
      update_imports_on_move = false,
      require_confirmation_on_move = false,
      watch_dir = nil,

      -- filter diagnostics
      filter_out_diagnostics_by_severity = {},
      filter_out_diagnostics_by_code = {},
    }

    -- required to fix code action ranges and filter diagnostics
    ts_utils.setup_client(client)

    if client.server_capabilities.documentHighlight then
      vim.cmd [[
      hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      ]]
      vim.api.nvim_create_augroup('lsp_document_highlight', {
        clear = false
      })
      vim.api.nvim_clear_autocmds({
        buffer = bufnr,
        group = 'lsp_document_highlight',
      })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = 'lsp_document_highlight',
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd('CursorMoved', {
        group = 'lsp_document_highlight',
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
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
}

-- type check entire project
if isModuleAvailable('tsc') then
  require('tsc').setup()
end

-- LSP border
local border = {
  {"🭽", "FloatBorder"},
  {"▔", "FloatBorder"},
  {"🭾", "FloatBorder"},
  {"▕", "FloatBorder"},
  {"🭿", "FloatBorder"},
  {"▁", "FloatBorder"},
  {"🭼", "FloatBorder"},
  {"▏", "FloatBorder"},
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
    prefix = '▎', -- Could be '●', '▎', 'x'
  }
})
