let myTheme = 'dark'

" ~~~~~~~~~~~~~~~~~~~
"       INDEX
" ~~~~~~~~~~~~~~~~~~~
" PLUGINS
" THEMES
" KEYMAPS
" SETTINGS
" PLUGIN-SETTINGS

" ================================================================================ "
"                                    MARK: PLUGINS                                    "
" ================================================================================ "
if has('nvim')
  call plug#begin('~/.config/nvim/plugins')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'godlygeek/tabular'
  Plug 'rhysd/git-messenger.vim'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-eunuch'
  Plug 'tomtom/tcomment_vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-fuzzy.vim'
  Plug 'bronson/vim-visual-star-search'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'matze/vim-move'
  Plug 'jceb/vim-orgmode'
  Plug 'alok/notational-fzf-vim'
  Plug 'ap/vim-css-color'
  Plug 'flazz/vim-colorschemes'

  Plug 'itchyny/lightline.vim'
  Plug 'majutsushi/tagbar'
  Plug 'janko-m/vim-test'

  Plug 'mbbill/undotree'
  Plug 'chaoren/vim-wordmotion'

  Plug 'voldikss/vim-floaterm'
  " Plug 'conweller/findr.vim'

  " Directory browser
  Plug 'scrooloose/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'

  " Languages
  " Plug 'pangloss/vim-javascript'
  Plug 'yuezk/vim-js'
  Plug 'jparise/vim-graphql'
  Plug 'alcesleo/vim-uppercase-sql'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'leafgarland/typescript-vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'keith/swift.vim'
  Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " Use release branch
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'antoinemadec/coc-fzf'
  Plug 'honza/vim-snippets'
  Plug 'janko/vim-test'

  " Misc
  Plug 'Raimondi/delimitMate' " automatic closing of braces, etc.
  call plug#end() " Call :PlugInstall to install plugins.
endif

" ================================================================================ "
"                                 LIGHTLINE                                        "
" ================================================================================ "
let g:lightline = {
  \ 'colorscheme': 'ayu_light',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'modified' ],
  \     [ 'coc_error', 'coc_warning', 'coc_info', 'coc_hint', 'coc_fix' ]
  \   ],
  \   'right':[
  \     [ 'totallines' ],
  \     [ 'filetype' ],
  \     [ 'blame' ],
  \     [ 'gitbranch' ]
  \   ],
  \ },
  \ 'mode_map': {
  \ 'n' : '(⊃⌐■_■)⊃',
  \ 'i' : ' _〆(￣ー￣)',
  \ 'R' : ' ─=≡Σ((( つ＞＜)つ',
  \ 'v' : '( ・・)⊃-二',
  \ 'V' : '( ・・)⊃-二二',
  \ "\<C-v>": '( ・・)つ●',
  \ 'c' : 'v(-_-)v',
  \ 's' : 'S',
  \ 'S' : 'SL',
  \ "\<C-s>": 'SB',
  \ 't': 'T',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ 'inactive': {
  \   'left': [],
  \   'right': []
  \ },
  \ 'enable': {
    \ 'statusline': 1,
    \ 'tabline': 0
  \ },
  \ 'component_function': {
  \   'blame': 'LightlineGitBlame',
  \   'gitbranch': 'fugitive#head',
  \   'currentline': 'CurrentLightLineLineInfo',
  \   'totallines': 'TotalLightLineLineInfo'
  \ },
  \ 'component_expand': {
  \   'coc_error'     : 'LightlineCocErrors',
  \   'coc_warning'   : 'LightlineCocWarnings',
  \   'coc_info'      : 'LightlineCocInfos',
  \   'coc_hint'      : 'LightlineCocHints',
  \   'coc_fix'       : 'LightlineCocFixes'
  \ },
\ }

" ================================================================================ "
"                                     MARK: THEMES                                    "
" ================================================================================ "
function! SetTheme(theme)
  if a:theme == 'dark'
    " Dark
    set background=dark
    " color Parapluie
    color molokai
  else
    " Light
    set background=light
    color Parasol
  endif

  call CustomizeTheme(a:theme)
endfunction

function! CustomizeTheme(theme)
  if a:theme == 'dark'
    hi Normal guibg=none ctermbg=none
    hi NonText guifg=#575757 guibg=none ctermbg=none
    hi MatchParen guibg=#323232 ctermbg=237 guifg=#888888 ctermfg=white
    hi Search guibg=#7B00D2 guifg=none gui=bold ctermbg=237 cterm=bold

    hi TabLine guibg=#333333 guifg=#aa88ee gui=bold
    hi TabLineSel guibg=#442288 guifg=#aa88ee gui=bold
    hi TabLineFileSel guibg=#442288 guifg=#ffffff gui=bold
    hi TabLineDirSel guibg=#442288 guifg=#aa88ee gui=bold
    hi TabLineFile guibg=#333333 guifg=#aaaaee gui=bold
    hi TabLineDir guibg=#333333 guifg=#8888bb gui=bold

    hi StatusLine guibg=NONE guifg=#777777 gui=none
    hi StatusLineNC guibg=NONE guifg=#333333 gui=none

    hi VertSplit guibg=none guifg=#333333 ctermbg=none ctermfg=none
    " hi Comment guibg=none ctermbg=none gui=italic cterm=italic
    " hi Comment guibg=none ctermbg=none gui=italic cterm=italic

    hi SignColumn guibg=none ctermbg=none
    hi CursorLineNr guifg=#333333 guibg=none ctermbg=none
    hi CursorLine guibg=none ctermbg=none guifg=#FFFFFF ctermfg=white gui=bold cterm=bold
    hi LineNr guibg=none guifg=#333355 ctermbg=none
    hi GitGutterAdd guibg=none ctermbg=none guifg=#89E455 ctermfg=green
    hi GitGutterChange guibg=none ctermbg=none guifg=#0CA8FC ctermfg=blue
    hi GitGutterDelete guibg=none ctermbg=none guifg=#FB263F ctermfg=red
    hi GitGutterChangeDelete guibg=none ctermbg=none guifg=#0CA8FC ctermfg=blue
    highlight TrailingSpace guibg=#424242 guifg=#ffffff
    call matchadd('TrailingSpace', '\s\+$', 80)

    " wombat, solarized, powerline, powerlineish,
    " jellybeans, molokai, seoul256, darcula,
    " selenized_dark, selenized_black, selenized_light, selenized_white,
    " Tomorrow, Tomorrow_Night, Tomorrow_Night_Blue,
    " Tomorrow_Night_Bright, Tomorrow_Night_Eighties, PaperColor,
    " landscape, one, materia, material, OldHope, nord, deus,
    " simpleblack, srcery_drk, ayu_mirage, ayu_light, ayu_dark and
    " 16color
    let g:lightline.colorscheme = 'molokai'
  else
    hi Normal guibg=#FFFFFF ctermbg=none
    hi NonText guifg=#BBBBBB guibg=none ctermbg=none
    hi BookmarkLine guibg=158 ctermbg=158 guibg=none ctermfg=none
    hi BookmarkSign guibg=none ctermbg=none guifg=black ctermfg=black
    " hi TabLineSel guibg=none ctermbg=none guifg=black ctermfg=black gui=bold cterm=bold
    " hi TabLineFill guibg=none ctermbg=none guifg=253 ctermfg=253 gui=bold cterm=bold
    " hi TabLine guibg=none ctermbg=242 guifg=253 ctermfg=253 gui=none cterm=none
    " hi TabLine guibg=#555555 ctermbg=none guifg=#999999 ctermfg=253 gui=none cterm=none
    hi VertSplit guibg=none guifg=#eeeeee ctermbg=none ctermfg=none
    highlight EndOfBuffer guifg=white guibg=white

    hi Beacon guibg=#aaaaee

    hi TabLineSel guibg=#442288 guifg=#aa88ee gui=bold
    hi TabLineFileSel guibg=#442288 guifg=#ffffff gui=bold
    hi TabLineDirSel guibg=#442288 guifg=#aa88ee gui=bold
    hi TabLineFile guibg=default guifg=#aaaaee gui=bold
    hi TabLineDir guibg=default guifg=#8888bb gui=bold

    hi MatchParen guibg=#eeeeee ctermbg=254 guifg=#777777 ctermfg=black
    hi Search guibg=#FECB32 guifg=none gui=bold ctermbg=221 cterm=bold

    hi StatusLine guibg=#eeeeee guifg=#777777
    hi StatusLineNC guibg=#eeeeee guifg=#dddddd

    hi Comment guibg=NONE guifg=#aaaaaa ctermfg=248 ctermbg=NONE gui=none

    hi SignColumn guibg=none ctermbg=none
    hi CursorLineNr guibg=none ctermbg=none
    hi CursorLine guibg=none ctermbg=none guifg=#000000 ctermfg=black gui=bold cterm=bold
    hi LineNr guibg=none guifg=#cccccc ctermbg=none
    hi GitGutterAdd guibg=#baf49c ctermbg=none guifg=#3a990a ctermfg=green
    hi GitGutterChange guibg=#b5dafc ctermbg=none guifg=#0CA8FC ctermfg=blue
    hi GitGutterDelete guibg=#f7b4be ctermbg=none guifg=#e0081e ctermfg=red
    hi GitGutterChangeDelete guibg=#b5dafc ctermbg=none guifg=#0CA8FC ctermfg=blue
    highlight TrailingSpace guibg=#eeeeee guifg=#888888
    call matchadd('TrailingSpace', '\s\+$', 80)

    let g:lightline.colorscheme = 'ayu_light'
  endif
  " Theme modification
  hi Constant guibg=none ctermbg=none
  hi Special guibg=none ctermbg=none
  hi Group guibg=none ctermbg=none
  hi Error guibg=#ed1b04 guifg=#ffe1dd ctermbg=none
  hi Warning guibg=#ffe100 guifg=#1c1c1c ctermbg=none
  hi htmlArg gui=italic cterm=italic
  hi EasyMotionTarget guibg=#eeeeee guifg=#000000 gui=bold,underline cterm=bold,underline ctermfg=black ctermbg=lightgray
  hi link EasyMotionTarget2First EasyMotionTarget
  hi link EasyMotionTarget2Second EasyMotionTarget
  hi link EasyMotionShade Comment
  hi link EasyMotionMoveHL Search
  hi Pmenu guibg=#171d29 guifg=#cad1e0
  hi PmenuSel guifg=#ffffff guibg=#ff0ae7
  hi PmenuSbar guibg=#d819e6
  hi PmenuThumb guibg=#444444
endfunction

" ================================================================================ "
"                                      MARK: KEYMAPS                                  "
" ================================================================================ "
nnoremap <space> <Nop>
let mapleader = " "
nnoremap j gj
nnoremap k gk
" nnoremap mm @
" nnoremap mr q
nnoremap q <Nop>
nnoremap <BS> <Nop>
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
noremap <Up> k
noremap <Down> j
noremap <Left> h
noremap <Right> l
inoremap <C-l> <Esc>la
inoremap <C-h> <Esc>ha
inoremap <C-j> <Esc>o
inoremap <C-k> <Esc>ko
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l
nnoremap <leader>w <C-w><C-p>
nnoremap ]] :cn<CR>
nnoremap [[ :cp<CR>
nnoremap 0 ^
nnoremap ^ 0
nnoremap - $
" nnoremap <leader><leader> :checktime<CR>:syntax sync fromstart<CR>
nnoremap zm zz
nnoremap zz zt4k4j
nnoremap zb zb4j4k
nnoremap <C-d> 4j
nnoremap <C-u> 4k
nnoremap y "*y
nnoremap Y y$
nnoremap gb <C-^>
nnoremap gt <C-w>gf:NERDTreeMirror<CR><C-w><C-w>
nnoremap <C-i> <C-o>
nnoremap <C-o> <C-i>
nnoremap <S-Tab> o
inoremap <S-Tab> <C-d>
" nmap <leader>i :echo expand('%:p:h') . "/"<CR>
nnoremap <leader>k :noh<return><esc>
nnoremap <leader>p :e $MYVIMRC<CR>
nnoremap <leader>v :Lines MARK: \| TODO: \| FIXME: <CR>
" nnoremap <leader>v :source $MYVIMRC<CR>:LightlineReload<CR>
" nnoremap <leader>v :source $MYVIMRC<CR>:LightlineReload<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>e :edit /<left>
nnoremap <leader>r :%s///g<left><left><left>
nnoremap <leader>c :lcd %:p:h<CR>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Git
nnoremap <leader>gd :Gdiff<CR>
nmap gp <Plug>(coc-git-prevchunk)
nmap gn <Plug>(coc-git-nextchunk)
nmap <leader>gs <Plug>(coc-git-chunkinfo)
nmap <leader>gi <Plug>(coc-git-commit)
nnoremap <leader>gc :BCommits<CR>
nnoremap <silent> <leader>gf :CocCommand git.foldUnchanged<CR>
nnoremap <silent> <leader>gu :CocCommand git.chunkUndo<CR>

nnoremap <leader>f :Rg<space>
vnoremap <leader>f y:Rg<space><C-r>0<CR>
nnoremap <leader>* viwy:Rg<space><C-r>0<CR>
nnoremap * *N
nnoremap <leader>b :Windows<CR>
nnoremap <leader>t :tabnew<CR>:NERDTreeMirror<CR><C-w><C-w>
nnoremap <leader>1 :tabn1<CR>
nnoremap <leader>2 :tabn2<CR>
nnoremap <leader>3 :tabn3<CR>
nnoremap <leader>4 :tabn4<CR>
nnoremap <leader>5 :tabn5<CR>
nnoremap <leader>6 :tabn6<CR>
nnoremap <leader>7 :tabn7<CR>
nnoremap <leader>8 :tabn8<CR>
nnoremap <leader>9 :tabn9<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
set t_Co=256

" Delete and cut and paste FIXED :D
nnoremap p p`[v`]=<C-o>
nnoremap P P`[v`]=<C-o>
xnoremap p pgv"@=v:register.'y'<cr>
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap dw "_dw
nnoremap Dw "_Dw
vnoremap dw "_dw
nnoremap diw "_diw
nnoremap Diw "_Diw
vnoremap diw "_diw
nnoremap ciw "_ciw
nnoremap Ciw "_Ciw
vnoremap ciw "_ciw
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
  nnoremap <leader>d "+d
  nnoremap <leader>D "+D
  vnoremap <leader>d "+d
else
  set clipboard=unnamed
  nnoremap <leader>d "*d
  nnoremap <leader>D "*D
  vnoremap <leader>d "*d
endif
xnoremap <expr> p 'pgv"'.v:register.'y`>'

" ================================================================================ "
"                                    MARK: SETTINGS                                   "
" ================================================================================ "
if has("autocmd")
  autocmd ColorScheme * call SetTheme(myTheme)
  autocmd filetype crontab setlocal nobackup nowritebackup
  " set filetypes as typescript.tsx
  autocmd BufNewFile,BufRead *.js,*.ts,*.tsx,*.jsx set filetype=typescript.tsx
  autocmd BufRead /tmp/psql.edit.* set syntax=sql
  autocmd BufEnter * :syntax sync fromstart
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
  autocmd FileType elm setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType fzf tnoremap <buffer> <esc> <c-c>
endif
syntax enable       " enable syntax processing
filetype plugin on
set tags=./tags;
set noautochdir
set splitbelow
set splitright
set t_ut= "disable the Background Color Erase that messes with some color schemes
set switchbuf=usetab,newtab
set hidden
set autoread
set autowriteall
set ignorecase
set smartcase
set so=5
set linebreak
set undofile
set nobackup
set noswapfile
set noshowmode
set number
set numberwidth=3
set linespace=0
set whichwrap=b,s,<,>,h,l,[,]
set backspace+=indent,eol,start
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2
set expandtab       " tabs are spaces
set smartindent
set autoindent
set breakindent
set showbreak=ꜜ··
set list
set listchars=tab:▸·,trail:·
set fillchars=vert:⎪
set iskeyword+=-
set cinoptions=+0
set showcmd         " show command in bottom bar
set wildmenu        " visual autocomplete for command menu
set wildignore+=*/node_modules/,.git,.git/*,node_modules/*,node_modules,.DS_Store,*/dist/,dist/*,dist
set wildcharm=<C-z>
set wildignorecase
set wildmode=full
set completeopt=menu,noselect,noinsert
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set showtabline=2
set laststatus=2
set mouse=
set ff=unix
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" ================================================================================ "
"                                MARK: PLUGIN-SETTINGS                                "
" ================================================================================ "
" MARK: plugin linenum
let g:line_number_interval#enable_at_startup = 1
let g:line_number_interval = 5

" MARK: plugin syntax
syntax match devComment "\v.*$"
highlight link devComment Comment

" MARK: plugin incsearch
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
nmap <leader>/ <Plug>(incsearch-fuzzy-/)
nmap <leader>? <Plug>(incsearch-fuzzy-?)

" MARK: plugin move
let g:move_map_keys = 0
nmap J V<Plug>MoveBlockDown<Esc>
nmap K V<Plug>MoveBlockUp<Esc>
vmap J <Plug>MoveBlockDown
vmap K <Plug>MoveBlockUp
nnoremap H V<gv<Esc>
nnoremap L V>gv<Esc>
vnoremap H <gv
vnoremap L >gv

" MARK: plugin javascript
set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = "./node_modules/"
    let packageJsonPath = nodeModules . a:fname . "/package.json"
    let srcPath = "../../"
    let srcFilePath = srcPath . a:fname . ".js"
    let sharedPath = "../../shared/"
    let sharedFilePath = sharedPath . a:fname . ".js"
    let appPath = "../../apps/"
    let appFilePath = appPath . a:fname . ".js"
    if filereadable(packageJsonPath)
        return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
    elseif filereadable(expand(srcFilePath))
        return srcFilePath
    elseif filereadable(expand(sharedFilePath))
        return sharedFilePath
    elseif filereadable(expand(appFilePath))
        return appFilePath
    else
        return nodeModules . a:fname
    endif
endfunction
set includeexpr=LoadMainNodeModule(v:fname)

" MARK: plugin test
let test#javascript#jest#executable = 'CI=true npm test --colors'
" make test commands execute using dispatch.vim
let test#strategy = "neovim"
" let test#neovim#term_position = "bottom"
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestCurrent :call  CocAction('runCommand', 'jest.fileTest', ['%'])
" Run jest for current test
" nnoremap <leader>r :call CocAction('runCommand', 'jest.singleTest')<CR>
" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')

" MARK: plugin coc
" nnoremap <leader><leader> :CocList<CR>
nmap gi <Plug>(coc-diagnostic-info)
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gw <Plug>(coc-diagnostic-next)<Esc>
nmap ge <Plug>(coc-diagnostic-next-error)<Esc>
" nmap gep <Plug>(coc-diagnostic-prev-error)
" nmap gwp <Plug>(coc-diagnostic-prev)
" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-n> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <CR>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<CR>"
" use <c-space>for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" MARK: plugin lightline
command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  return blame
endfunction

function! LightlineTabs() abort
  return MyTabLine()
endfunction

function! CurrentLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return line('.')
  else
    return ''
  endif
endfunction

function! TotalLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return line('$')
  else
    return ''
  endif
endfunction

function! s:lightline_coc_diagnostic(kind, sign, pre) abort
  let info = get(b:, 'coc_diagnostic_info', 0)
  if empty(info) || get(info, a:kind, 0) == 0
    return ''
  endif
  try
    let s = g:coc_user_config['diagnostic'][a:sign . 'Sign']
  catch
    let s = ''
  endtry
  return printf('%s%s %d', a:pre, s, info[a:kind])
endfunction

function! LightlineCocErrors() abort
  return s:lightline_coc_diagnostic('error', 'error', '⛔️')
endfunction

function! LightlineCocWarnings() abort
  return s:lightline_coc_diagnostic('warning', 'warning', '⚠️ ')
endfunction

function! LightlineCocInfos() abort
  return s:lightline_coc_diagnostic('information', 'info', 'ℹ️ ')
endfunction

function! LightlineCocHints() abort
  return s:lightline_coc_diagnostic('hints', 'hint', '❕')
endfunction

function! LightlineCocFixes() abort
  return s:lightline_coc_diagnostic('fixes', 'fix', '❕')
endfunction

let g:lightline.component_type = {
\   'coc_error'        : 'error',
\   'coc_warning'      : 'warning',
\   'coc_info'         : 'tabsel',
\   'coc_hint'         : 'middle',
\   'coc_fix'          : 'middle',
\ }

autocmd User CocDiagnosticChange call lightline#update()

" MARK: plugin tab bar
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = ''
  " select the highlighting
  for i in range(tabpagenr('$'))
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel# '
    else
      let s .= '%#TabLine# '
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
    " the label is made by MyTabLabel()
    let cwd = expand('%:p:h')
    let tabFile = '%{MyTabFile(' . (i + 1) . ')}'
    let tabDir = '%{MyTabDir(' . (i + 1) . ')}'
    " let tabFile = '%{MyTabPath(' . (i + 1) . ')}'
    let tabPath = MyTabPath(i + 1)
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#' .  WebDevIconsGetFileTypeSymbol(tabPath) . ' %#TabLineDirSel#' . tabDir . ' › ' .  '%#TabLineFileSel#' . tabFile
    else
      let s .= ''.  WebDevIconsGetFileTypeSymbol(tabPath) . ' %#TabLineDir#' . tabDir . ' › ' . '%#TabLineFile#' . tabFile
    endif
    if i + 1 == tabpagenr()
      " let s .= '(っ˘̩ᴗ˘̩)っ ﹒︠ᴗ﹒︡ ⌨  '
      let s .= '  '
    else
      let s .= '  '
    endif
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  return s
endfunction
function! MyTabPath(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label = bufname(buflist[winnr - 1])
  let filename = fnamemodify(label, ':p')
  return filename
endfunction
function! MyTabDir(n)
  ":p expand to full path
  ":h head (last path component removed)
  ":t tail (last path component only)
  ":r root (one extension removed)
  ":e extension only
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label = bufname(buflist[winnr - 1])
  let filename = fnamemodify(label, ':t:r')
  let filenamePath = fnamemodify(label, ':h:t')
  let shortPath = pathshorten(fnamemodify(label, ':h'))
  let shortPathOneFolder = fnamemodify(shortPath, ':h:t')
  return '' . shortPathOneFolder[1:] . '' . filenamePath
endfunction
function! MyTabFile(n)
  ":p expand to full path
  ":h head (last path component removed)
  ":t tail (last path component only)
  ":r root (one extension removed)
  ":e extension only
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label = bufname(buflist[winnr - 1])
  let filename = fnamemodify(label, ':t:r')
  return filename
endfunction

" MARK: plugin javascript
let g:javascript_plugin_jsdoc = 1

" MARK: plugin graphql
let g:graphql_javascript_tags = ["gql", "graphql", "Relay.QL"]
" Register tag name associated the filetype
call jspretmpl#register_tag('gql', 'graphql')
autocmd FileType javascript JsPreTmpl
autocmd FileType javascript.jsx JsPreTmpl

" MARK: plugin git
set signcolumn=yes
let g:gitgutter_override_sign_column_highlight = 0
set updatetime=300

" MARK: plugin markdown
let g:vim_markdown_folding_disabled = 1
set conceallevel=0
let g:markdown_fenced_languages = ['css', 'javascript', 'js=javascript', 'json=javascript']

" MARK: plugin rg
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
let g:rg_command = 'rg --vimgrep --line-number --glob "!*min.en-US.js"'
nnoremap <expr> p (&buftype is# "quickfix" ? "<CR>\|:copen<CR>" : "p")
nnoremap <expr> j (&buftype is# "quickfix" ? "<C-n>" : "j")
nnoremap <expr> k (&buftype is# "quickfix" ? "<C-p>" : "k")
nnoremap <expr> o (&buftype is# "quickfix" ? "<CR>" : "o")
let g:rg_derive_root = 1

let g:netrw_list_hide = &wildignore

" MARK: plugin fzf
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 100])])
    let height = min([&lines - 4, max([20, &lines - 0])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_COMMAND = 'rg --files'
set rtp+=~/.fzf

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('up:60%'), <bang>0)
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--preview-window', 'up:60%']}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
nnoremap <leader>o <Nop>
map <leader>oo :Files<CR>
nnoremap <leader><leader> :Files<CR>
nnoremap <leader>ot :FloatermToggle<CR>
nnoremap <leader>od :CocFzfList diagnostics<CR>
nnoremap <leader>os :CocFzfList symbols<CR>
nnoremap <leader>of :CocFzfList symbols --kind Function<CR>
nnoremap <leader>oa :CocFzfList actions<CR>
" nnoremap <leader>oto :FloatermNew<CR>
" nnoremap tn :FloatermNext<CR>
" nnoremap tp :FloatermPrev<CR>
map <leader>og :GF?<CR>
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

function! s:fzf_neighboring_files_sink(line)
  let current_file =expand("%")
  let cwd = fnamemodify(expand("%"), ':p:h')
  " let parts = split(a:line, '\t\zs')
  " let excmd = matchstr(parts[2:], '^.*\ze;"\t')
  " execute 'silent e' cwd './' a:line
  " execute 'echom "cwd"'
  execute 'silent e' cwd . '/' . a:line
endfunction
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  " let command = 'ls -F -a ' . cwd

  let directories = "find " . cwd . " -maxdepth 1 -mindepth 1 -type d | sed 's#.*/#./#' | sed 's#$#/#'"
  let files = "find " . cwd . " -maxdepth 1 -mindepth 1 -type f | sed 's#.*/##'"
  let command = files . ';' . directories  . ';' . "echo '../'"
  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': command,
        \ 'sink':   function('s:fzf_neighboring_files_sink'),
        \ 'options': '-m -x +s --preview-window=up:60%',
        \ 'window': 'call CreateCenteredFloatingWindow()' })))
endfunction
command! FZFNeigh call s:fzf_neighbouring_files()
nnoremap <leader>oi :FZFNeigh<CR>

augroup _fzf
  autocmd!
augroup END

" MARK: Findr
" let g:findr_border = {
"     \   'top':    ['╭', '─', '╮'],
"     \   'middle': ['│', ' ', '│'],
"     \   'bottom': ['╰', '─', '╯'],
"     \ }
" nnoremap <leader>i :Findr<CR>

" MARK: Floating window help
function! HelpFloatingWindow(query) abort
    let l:buf = CreateCenteredFloatingWindow()
    call nvim_set_current_buf(l:buf)
    setlocal filetype=help
    setlocal buftype=help
    nnoremap <buffer> <esc> :q<CR>
    " tnoremap <buffer> <esc> <c-c>
    execute 'help ' . a:query
endfunction
command! -complete=help -nargs=? Help call HelpFloatingWindow(<q-args>)

" MARK: Terminal floating window

let g:floaterm_background='black'
let g:floaterm_border_color='blue'
let g:floaterm_position='center'
let g:floaterm_height=0.6
let g:floaterm_width=0.9
let g:floaterm_borderchars=['─', '│', '─', '│', '╭', '╮', '╯', '╰']

" MARK: org
autocmd FileType org setlocal foldlevel=99

" MARK: notational
let g:nv_search_paths = ['~/Developer/org']

" MARK: wordmotion
let g:wordmotion_mappings = {
\ 'w' : 'W',
\ 'b' : 'B',
\ 'e' : 'E',
\ 'ge' : 'gE',
\ 'aw' : 'aW',
\ 'iw' : 'iW',
\ '<C-R><C-W>' : ''
\ }

" MARK: plugin nerd
nmap <leader>, :NERDTreeFind<CR>
let NERDTreeDirArrowExpandable="\u00a0"
let NERDTreeDirArrowCollapsible="\u00a0"
let NERDTreeNodeDelimiter="\u00b7"
let NERDTreeAutoCenter=0
let NERDTreeAutoDeleteBuffer=1
let NERDTreeQuitOnOpen=0
let NERDTreeMinimalUI=1
let NERDTreeWinSize=40
let NERDTreeRespectWildIgnore=1
" Autostart nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Autoquit nerdtree if the only one
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Follow mode
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
" Never open files in nerdtree
autocmd FileType nerdtree let t:nerdtree_winnr = bufwinnr('%')
autocmd BufWinEnter * call PreventBuffersInNERDTree()

function! PreventBuffersInNERDTree()
  if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree'
    \ && exists('t:nerdtree_winnr') && bufwinnr('%') == t:nerdtree_winnr
    \ && &buftype == '' && !exists('g:launching_fzf')
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    NERDTree
  endif
  if exists('g:launching_fzf') | unlet g:launching_fzf | endif
endfunction

" MARK: plugin devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" MARK: NERDtree git indicators
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "✚",
    \ "Untracked" : "*",
    \ "Renamed"   : "r",
    \ "Unmerged"  : "u",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "*",
    \ "Clean"     : "✔︎"
    \ }

" MARK: move tabs to splits
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

nnoremap <C-w>. :call MoveToNextTab()<CR>
nnoremap <C-w>, :call MoveToPrevTab()<CR>

" MARK: plugin zoom
" Zoom / Restore window.
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <leader>z :ZoomToggle<CR>

" MARK: plugin tagbar
let g:tagbar_type_elm = {
      \ 'kinds' : [
      \ 'f:function:0:0',
      \ 'm:modules:0:0',
      \ 'i:imports:1:0',
      \ 't:types:1:0',
      \ 'a:type aliases:0:0',
      \ 'c:type constructors:0:0',
      \ 'p:ports:0:0',
      \ 's:functions:0:0',
      \ ]
      \}

" MARK: reload vim
if !exists('*ReloadVim')
  function ReloadVim()
    source $MYVIMRC
    call LightlineReload()
  endfunction
endif
command! Reload :call ReloadVim()

" MARK: macros
let @c="oconsole.error('#DEBUG#');\<Esc>hhi"

call SetTheme(myTheme)
