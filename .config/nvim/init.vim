let myTheme = 'light'

" ~~~~~~~~~~~~~~~~~~~
"       INDEX
" ~~~~~~~~~~~~~~~~~~~
" go-PLUGINS
" go-THEMES
" go-KEYMAPS
" go-SETTINGS
" go-STATUS-LINE-COLORS
" go-PLUGIN-SETTINGS
"   > go-plug-TAB-BAR
"   > go-plug-COMPILE
"   > go-plug-AIRLINE
"   > go-plug-POSTGRES
"   > go-plug-JAVASCRIPT
"   > go-plug-GIT
"   > go-plug-MARKDOWN
"   > go-plug-RG
"   > go-plug-FZF
"   > go-plug-NERDTREE
"   > go-plug-DEVICONS
"   > go-plug-TODO
"   > go-plug-BOOKMARK
"   > go-plug-WRITING
"   > go-plug-PDF
"   > go-plug-ZOOM

" ================================================================================ "
"                                    go-PLUGINS                                    "
" ================================================================================ "
if has('nvim')
  call plug#begin('~/.local/share/nvim/plugged')
  Plug 'flazz/vim-colorschemes'
  Plug 'ap/vim-css-color'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'godlygeek/tabular'
  Plug 'vitalk/vim-simple-todo'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'bronson/vim-visual-star-search'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'easymotion/vim-easymotion'
  Plug 'matze/vim-move'
  " Plug 'yuttie/comfortable-motion.vim'
  Plug 'gcavallanti/vim-noscrollbar'
  Plug 'w0rp/ale'

  " Writing
  Plug 'reedes/vim-colors-pencil'
  Plug 'reedes/vim-wordy'
  Plug 'reedes/vim-lexical'
  Plug 'beloglazov/vim-online-thesaurus'
  Plug 'reedes/vim-litecorrect'
  Plug 'reedes/vim-textobj-sentence'
  Plug 'reedes/vim-textobj-quote'
  Plug 'kana/vim-textobj-user'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/goyo.vim'

  " Languages
  " Plug 'sheerun/vim-polyglot'
  Plug 'plasticboy/vim-markdown'
  " Plug 'pangloss/vim-javascript'
  Plug 'othree/yajs.vim'
  Plug 'othree/es.next.syntax.vim'
  Plug 'mxw/vim-jsx'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'wavded/vim-stylus'
  " Plug 'posva/vim-vue'
  " Plug 'digitaltoad/vim-pug'
  " Plug 'lifepillar/pgsql.vim'
  " Plug 'keith/swift.vim'
  Plug 'styled-components/vim-styled-components'
  " Plug 'hail2u/vim-css3-syntax'
  " Plug 'eslint/eslint'

  " Misc
  Plug 'Raimondi/delimitMate' " automatic closing of braces, etc.
  Plug 'lifepillar/vim-cheat40' " vim commands cheatsheet
  call plug#end() " Call :PlugInstall to install plugins.
endif

" ================================================================================ "
"                                     go-THEMES                                    "
" ================================================================================ "
function! SetTheme(theme)
  if a:theme == 'dark'
    " Dark
    set background=dark
    " colorscheme monokain
    " colorscheme neonwave
    " color pencil
    color Parapluie
    " let g:airline_theme = 'term'
    " let g:airline_theme = 'pencil'
    let g:airline_theme = 'raven'
    " let g:airline_theme = 'durant'
  else
    " Light
    set background=light
    " colorscheme hemisu
    " colorscheme soda
    " colorscheme bubblegum-256-light
    " color PaperColor
    " color github
    " color pencil
    color Parasol
    " let g:airline_theme = 'lucius'
    " let g:airline_theme = 'pencil'
    let g:airline_theme = 'light'
  endif
  call CustomizeTheme(a:theme)
endfunction

function! CustomizeTheme(theme)
  if a:theme == 'dark'
    hi Normal guibg=none ctermbg=none
    hi NonText guifg=#242447 guibg=none ctermbg=none
    " hi NonText guifg=#00a245 guibg=none ctermbg=none
    hi BookmarkLine guibg=#000000 ctermbg=235
    hi BookmarkSign ctermbg=NONE ctermfg=white
    hi TabLineSel guibg=none ctermbg=none guifg=#eeeeee ctermfg=white gui=bold cterm=bold
    hi TabLineSelPointer guibg=none ctermbg=none guifg=#ff00ff ctermfg=white gui=bold cterm=bold
    hi TabLineFill guibg=none ctermbg=none guifg=244 ctermfg=244 gui=bold cterm=bold
    hi TabLine guibg=none ctermbg=none guifg=#5C5C5C ctermfg=244 gui=none cterm=bold
    hi MatchParen guibg=#323232 ctermbg=237 guifg=#888888 ctermfg=white
    hi Search guibg=#7B00D2 guifg=none gui=bold ctermbg=237 cterm=bold

    hi StatusLine guibg=NONE guifg=#777777 gui=none
    hi StatusLineNC guibg=NONE guifg=#333333 gui=none

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
  else
    hi Normal guibg=#FFFFFF ctermbg=none
    hi NonText guifg=#BBBBBB guibg=none ctermbg=none
    hi BookmarkLine guibg=158 ctermbg=158 guibg=none ctermfg=none
    hi BookmarkSign guibg=none ctermbg=none guifg=black ctermfg=black
    hi TabLineSel guibg=none ctermbg=none guifg=black ctermfg=black gui=bold cterm=bold
    hi TabLineFill guibg=none ctermbg=none guifg=253 ctermfg=253 gui=bold cterm=bold
    " hi TabLine guibg=none ctermbg=242 guifg=253 ctermfg=253 gui=none cterm=none
    hi TabLine guibg=none ctermbg=none guifg=#999999 ctermfg=253 gui=none cterm=none
    hi MatchParen guibg=#eeeeee ctermbg=254 guifg=#777777 ctermfg=black
    hi Search guibg=#FECB32 guifg=none gui=bold ctermbg=221 cterm=bold

    hi StatusLine guibg=NONE guifg=#777777 gui=none ctermbg=none ctermfg=gray
    hi StatusLineNC guibg=NONE guifg=#dddddd gui=none ctermbg=none ctermfg=lightgray

    hi Comment guibg=NONE guifg=#aaaaaa ctermfg=248 ctermbg=NONE gui=none

    hi SignColumn guibg=none ctermbg=none
    hi CursorLineNr guibg=none ctermbg=none
    hi CursorLine guibg=none ctermbg=none guifg=#000000 ctermfg=black gui=bold cterm=bold
    hi LineNr guibg=none guifg=#aaaaaa ctermbg=none
    hi GitGutterAdd guibg=#baf49c ctermbg=none guifg=#3a990a ctermfg=green
    hi GitGutterChange guibg=#b5dafc ctermbg=none guifg=#0CA8FC ctermfg=blue
    hi GitGutterDelete guibg=#f7b4be ctermbg=none guifg=#e0081e ctermfg=red
    hi GitGutterChangeDelete guibg=#b5dafc ctermbg=none guifg=#0CA8FC ctermfg=blue
    highlight TrailingSpace guibg=#eeeeee guifg=#888888
    call matchadd('TrailingSpace', '\s\+$', 80)
  endif
  " Theme modification
  hi VertSplit guibg=none guifg=#cccccc ctermbg=none ctermfg=white
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
endfunction

" ================================================================================ "
"                                      go-KEYMAPS                                  "
" ================================================================================ "
nnoremap <space> <Nop>
let mapleader = " "
nnoremap j gj
nnoremap k gk
nnoremap m @
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
nnoremap ]] :cn<CR>
nnoremap [[ :cp<CR>
nnoremap 0 ^
nnoremap ^ 0
nnoremap - $
nnoremap <leader>o :call Fzf_open('')<CR>
nnoremap <leader>gg :call Fzf_open('git')<CR>
nnoremap <leader><leader> :checktime<CR>:syntax sync fromstart<CR>
nnoremap zm zz
nnoremap zz zt4k4j
nnoremap zb zb4j4k
nnoremap <C-d> 4jzt
nnoremap <C-u> 4kzb
nnoremap y "*y
nnoremap Y y$
nnoremap gb <C-^>
nnoremap gf <C-w>gf
nnoremap <C-w>gf gf
nnoremap <C-i> <C-o>
nnoremap <C-o> <C-i>
nmap <leader>i :echo expand('%:p:h') . "/"<CR>
nnoremap <leader>k :noh<return><esc>
nnoremap <leader>p :vsp $MYVIMRC<CR>
nnoremap <leader>v :source $MYVIMRC<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>s :w<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>e :edit /<left>
nnoremap <leader>r :%s///g<left><left>
" nnoremap <leader>n :tabn<CR>

" Git
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gu :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gh :GV<CR>
nmap <leader>gu <Plug>GitGutterUndoHunk
nmap gp <Plug>GitGutterPrevHunk
nmap gn <Plug>GitGutterNextHunk

nnoremap <leader>f :Rg<space>
vnoremap <leader>f y:Rg<space><C-r>0<CR>
nnoremap <leader>* viwy:Rg<space><C-r>0<CR>
nnoremap <leader>b :retab<CR>:%s/\s\+$//e<CR>
nnoremap <leader>c :call<space>CompileCode()<CR>
nnoremap <leader>0 a★<space><esc>
nnoremap <leader>1 1gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>2 2gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>3 3gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>4 4gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>5 5gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>6 6gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>7 7gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>8 8gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap <leader>9 9gt:NERDTreeTabsFind<CR><C-w><C-w>
nnoremap * *N

" Terminal
tnoremap <Esc> <C-\><C-n>

" Delete and cut and paste FIXED :D
nnoremap p p`[v`]=<C-o>
nnoremap P P`[v`]=<C-o>
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c
nnoremap C "_C
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap cw "_cw
nnoremap Cw "_Cw
vnoremap cw "_cw
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
"                                    go-SETTINGS                                   "
" ================================================================================ "
if has("autocmd")
  autocmd BufEnter *.svelte :setlocal filetype=html
  autocmd BufRead /tmp/psql.edit.* set syntax=sql
  autocmd BufEnter * :syntax sync fromstart
  autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
        \| exe "normal! g'\"" | endif
endif
syntax enable       " enable syntax processing
filetype plugin on
set tags=./tags;
let g:vimwiki_list = [{'path': '$HOME/Dropbox/Workspace'}]
set autoread
set ignorecase
set smartcase
set so=5
set linebreak
set nobackup
set noswapfile
set noshowmode
set number
set numberwidth=2
set linespace=0
set whichwrap=b,s,<,>,h,l,[,]
set backspace+=indent,eol,start
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set shiftwidth=2
set autoindent
set breakindent
set showbreak=\ ꜜ\ ··
set list
set listchars=tab:▸·,trail:·
" set fillchars=vert:▕
" set fillchars=vert:\ 
set fillchars=vert:·
set iskeyword+=-
set cinoptions=+0
set showcmd         " show command in bottom bar
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to.
set showmatch       " highlight matching [{()}]
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set showtabline=2
set mouse=
set ff=unix
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if has('nvim')
  set t_8f=\[[38;2;%lu;%lu;%lum
  set t_8b=\[[48;2;%lu;%lu;%lum
  set termguicolors
endif
if !has('gui_running')
  set t_Co=256
endif


" ================================================================================ "
"                             go-STATUS-LINE-COLORS                                "
" ================================================================================ "
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatusLine guibg=NONE guifg=white cterm=NONE ctermbg=none ctermfg=black
  else
    hi StatusLine guibg=NONE guifg=#777777 cterm=NONE ctermfg=black ctermbg=none
  endif
endfunction

function! InsertLeaveActions()
  hi StatusLine guibg=NONE guifg=#777777 cterm=NONE ctermfg=black ctermbg=none
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * call InsertLeaveActions()

" to handle exiting insert mode via a control-C
inoremap <c-c> <c-o>:call InsertLeaveActions()<cr><c-c>

" have a permanent statusline to color
set laststatus=0
set statusline=
set statusline+=%=
set statusline+=\ %{noscrollbar#statusline(15,'▬','■')}

" ================================================================================ "
"                                go-PLUGIN-SETTINGS                                "
" ================================================================================ "
let g:pencil_higher_contrast_ui = 1

" go-plug-TAB-BAR
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel# '
    else
      let s .= '%#TabLine# '
    endif
    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'
    " the label is made by MyTabLabel()
    let cwd = expand('%:p:h')
    let tabLabel = '' . (i + 1) . ':%{MyTabLabel(' . (i + 1) . ')}'
    let tabFile = '%{MyTabPath(' . (i + 1) . ')}'
    let tabPath = MyTabPath(i + 1)
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSelPointer#' .  WebDevIconsGetFileTypeSymbol(tabPath) .  '%#TabLineSel# ' . tabLabel
    else
      let s .= ''.  WebDevIconsGetFileTypeSymbol(tabPath) . ' ' . tabLabel
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
function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let label = bufname(buflist[winnr - 1])
  let filename = fnamemodify(label, ':t')
  return filename
endfunction

" go-plug-GoFile!
set path=.,src
set suffixesadd=.js,.jsx

function! LoadMainNodeModule(fname)
    let nodeModules = './node_modules/'
    let packageJsonPath = nodeModules . a:fname . '/package.json'

    if filereadable(packageJsonPath)
        return nodeModules . a:fname . '/' . json_decode(join(readfile(packageJsonPath))).main
    else
        return nodeModules . a:fname
    endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

" go-plug-EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_startofline = 0
map  ff <Plug>(easymotion-s2)
map  fh <Plug>(easymotion-linebackward)
map  fj <Plug>(easymotion-j)
map  fk <Plug>(easymotion-k)
map  fl <Plug>(easymotion-lineforward)

" go-plug-MOVE
let g:move_map_keys = 0
vmap <C-j> <Plug>MoveBlockDown
vmap <C-k> <Plug>MoveBlockUp
vmap <C-h> <Plug>MoveBlockLeft
vmap <C-l> <Plug>MoveBlockRight

" go-plug-ALE
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_loc_list_height = 5
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_error_symbol = '⚠️'
" let g:syntastic_style_error_symbol = '⚠️'
" let g:syntastic_warning_symbol = '⚠️'
" let g:syntastic_style_warning_symbol = '💩'
" highlight link SyntasticErrorSign SignColumn
" highlight link SyntasticWarningSign SignColumn
" highlight link SyntasticStyleErrorSign SignColumn
" highlight link SyntasticStyleWarningSign SignColumn
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
" let g:ale_sign_error = '❌'
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '🎭'

" go-plug-COMPILE
" Compile code based on file type
function! CompileCode()
  if (&ft == 'python')
    execute '!/usr/bin/python %'
  endif
  if (&ft == 'javascript')
    execute '!/usr/bin/node %'
  endif
endfunction

" go-plug-AIRLINE
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ' * '
let g:airline_right_sep = ' * '
" let g:airline_section_z = '%{strftime("%h %d %H:%M")}'
" let g:airline_section_c = '♕  High Tech | Low Life ♙ '
let g:airline_section_c = ''
" let g:airline_section_x = ''
" let g:airline_section_y = ''
" let g:airline_section_z = '♕ l%l'
let g:airline_section_z = '%l'

" go-plug-POSTGRES
let g:sql_type_default = 'pgsql'

" go-plug-JAVASCRIPT
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:used_javascript_libs = 'vue'

" go-plug-GIT
" let g:gitgutter_sign_column_always = 1
set signcolumn=yes
let g:gitgutter_override_sign_column_highlight = 0
set updatetime=300

" go-plug-MARKDOWN
let g:vim_markdown_folding_disabled = 1

" go-plug-RG
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

" go-plug-FZF
set rtp+=~/.fzf
" let g:fzf_layout = { 'window': 'enew' }
let $FZF_DEFAULT_COMMAND = 'rg --smart-case -g "!node_modules/" -l ""'
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --smart-case --column --line-number --no-heading --color=always -g "!node_modules/" '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('down:70%')
      \           : fzf#vim#with_preview('right:30%:hidden', '?'),
      \   <bang>0)

" Files + devicons
function! Fzf_open(arg)
  let option = a:arg
  let l:fzf_files_options =
        \ '--preview "echo {} | tr -s \" \" \"\n\" | tail -1 | xargs rougify | head -'.&lines.'"'

  function! s:files(option)
    let l:fzfCommand = $FZF_DEFAULT_COMMAND
    if (a:option == 'git')
      let l:fzfCommand = 'git ls-files --exclude-standard --others --modified'
    else
      let l:fzfCommand = $FZF_DEFAULT_COMMAND
    endif
    let l:files = split(system(l:fzfCommand), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:parts = split(a:item, ' ')
    let l:file_path = get(l:parts, 1, '')
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(option),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '70%' })
endfunction

" go-plug-NERDTREE
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autofind = 1
let g:NERDTreeUpdateOnCursorHold = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusNodeColorization = 1
highlight link NERDTreeDir Question
highlight link NERDTreeGitStatusIgnored Comment
highlight link NERDTreeGitStatusModified cssURL
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeDirArrowExpandable = nr2char(8200)
let g:NERDTreeDirArrowCollapsible = nr2char(8200)
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\.DS_Store$', '\.git$', 'node_modules$']
"if you show hidden characters, this hides them in NERDTree
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "*",
      \ "Staged"    : "+",
      \ "Untracked" : "?",
      \ "Renamed"   : "_",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "-",
      \ "Dirty"     : "~",
      \ "Clean"     : "✓",
      \ 'Ignored'   : '✗',
      \ "Unknown"   : "?"
      \ }
nmap <leader>j :NERDTreeTabsFind<CR>
nmap <leader>n :NERDTreeTabsToggle<CR>
let NERDTreeMapJumpNextSibling = '\t'
let NERDTreeMapJumpPrevSibling = '\t'
let NERDTreeMapToggleFilters = '\t'
let g:NERDTreeWinSize=30
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeNaturalSort = 1
let g:NERDTreeCaseSensitiveSort = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeAutoDeleteBuffer = 1

" go-plug-DEVICONS
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.*css\.js$'] = ''

" go-plug-TODO
let g:simple_todo_tick_symbol = '✓'
let g:simple_todo_map_keys = 0
" nmap <leader>i <Plug>(simple-todo-new-start-of-line)
nmap <leader>x <Plug>(simple-todo-mark-switch)

" go-plug-BOOKMARK
let g:bookmark_highlight_lines = 1
let g:bookmark_sign = '♞'

" go-plug-WRITING
augroup lexical
  autocmd!
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1
" augroup pencil
"     autocmd!
"     autocmd FileType markdown,mkd call pencil#init()
"                 \ | call lexical#init()
"                 \ | call litecorrect#init()
"                 \ | call textobj#quote#init()
"                 \ | call textobj#sentence#init()
" augroup END
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = '#777777'

" GOYO Mode
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  :NERDTreeTabsToggle<CR>
  " set bg=light
  " if !has('gui_running')
  "     let g:solarized_termcolors=256
  " endif
  " colors solarized
endfunction
command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

" go-plug-PDF
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

" go-plug-ZOOM
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

" Macros
let @c = "oconsole.error('\<Esc>a"
let @f = "oconst @@@ = (\<Esc>A => {\<Enter>\<Esc>O"
nnoremap mm f@ct<space>

call SetTheme(myTheme)
