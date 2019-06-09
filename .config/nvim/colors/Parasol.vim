" Parasol
hi clear

if exists("syntax on")
syntax reset
endif

let g:colors_name = "Parasol"
set background=light

let g:parasol_bold=1
let g:parasol_italic=1
let g:parasol_italic=0
let g:parasol_undercurl=1
let g:parasol_underline=1
let g:parasol_inverse=1

" setup palette dictionary
let s:color = {}

" fill it with absolute colors
let s:color.dark0       = ['#004260', 235]     " 40-40-40
let s:color.dark1       = ['#000000', 237]     " 60-56-54
let s:color.dark2       = ['#004260', 239]     " 80-73-69
let s:color.dark3       = ['#004260', 241]     " 102-92-84
let s:color.dark4       = ['#0032aa', 243]     " 124-111-100

let s:lightgray    = ['#efeff6', 244]     " 146-131-116
let s:color.gray_245    = ['#BFBFBF', 245]     " 146-131-116
let s:color.gray_244    = ['#BFBFBF', 244]     " 146-131-116

let s:color.light0      = ['#ffffff', 229]     " 253-244-193
let s:color.light1      = ['#ffffff', 223]     " 235-219-178
let s:color.light2      = ['#ffffff', 250]     " 213-196-161
let s:color.light3      = ['#ffffff', 248]     " 189-174-147
let s:color.light4      = ['#ffffff', 246]     " 168-153-132

let s:red    = ['#ff1878', 124]
let s:green  = ['#00a245', 106]
let s:pink = ['#F650DC', 172]
let s:blue   = ['#008ED4', 66]
let s:purple = ['#7540CA', 132]
let s:aqua   = ['#80A5E9', 72]
let s:darkblue   = ['#004260', 72]

let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
let s:bg0  = s:color.light0
let s:bg1  = s:color.light1
let s:bg2  = s:color.light2
let s:bg3  = s:color.light3
let s:bg4  = s:color.light4

let s:gray = s:color.gray_244

let s:fg0 = s:color.dark0
let s:fg1 = s:color.dark1
let s:fg2 = s:color.dark2
let s:fg3 = s:color.dark3
let s:fg4 = s:color.dark4

" save current relative colors back to palette dictionary
let s:color.bg0 = s:bg0
let s:color.bg1 = s:bg1
let s:color.bg2 = s:bg2
let s:color.bg3 = s:bg3
let s:color.bg4 = s:bg4

let s:color.gray = s:gray

let s:color.fg0 = s:fg0
let s:color.fg1 = s:fg1
let s:color.fg2 = s:fg2
let s:color.fg3 = s:fg3
let s:color.fg4 = s:fg4

let s:hls_cursor = s:blue
let s:number_column = s:none
let s:sign_column = s:bg1
let s:color_column = s:bg1
let s:vert_split = s:bg0
let s:invert_signs = ''
let s:invert_selection = s:inverse
let s:invert_tabline = ''
let s:italicize_comments = s:italic
let s:italicize_strings = ''

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" memoize common hi groups
call s:HL('parasolFg0', s:fg0)
call s:HL('parasolFg1', s:fg1)
call s:HL('parasolFg2', s:fg2)
call s:HL('parasolFg3', s:fg3)
call s:HL('parasolFg4', s:fg4)
call s:HL('parasolGray', s:gray)
call s:HL('parasolBg0', s:bg0)
call s:HL('parasolBg1', s:bg1)
call s:HL('parasolBg2', s:bg2)
call s:HL('parasolBg3', s:bg3)
call s:HL('parasolBg4', s:bg4)

call s:HL('parasolRed', s:red)
call s:HL('parasolRedBold', s:red, s:none, s:bold)
call s:HL('parasolGreen', s:green)
call s:HL('parasolGreenBold', s:green, s:none, s:bold)
call s:HL('parasolPink', s:pink)
call s:HL('parasolPinkBold', s:pink, s:none, s:bold)
call s:HL('parasolBlue', s:blue)
call s:HL('parasolBlueBold', s:blue, s:none, s:bold)
call s:HL('parasolPurple', s:purple)
call s:HL('parasolPurpleBold', s:purple, s:none, s:bold)
call s:HL('parasolAqua', s:aqua)
call s:HL('parasolAquaBold', s:aqua, s:none, s:bold)
call s:HL('parasolDarkblue', s:darkblue)
call s:HL('parasolDarkblueBold', s:darkblue, s:none, s:bold)

call s:HL('parasolRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('parasolGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('parasolPinkSign', s:pink, s:sign_column, s:invert_signs)
call s:HL('parasolDarkblueSign', s:darkblue, s:sign_column, s:invert_signs)
call s:HL('parasolBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('parasolPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('parasolAquaSign', s:aqua, s:sign_column, s:invert_signs)

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Screen line that the cursor is
call s:HL('CursorLine',   s:none, s:bg1)
" Screen column that the cursor is
hi! link CursorColumn CursorLine

" Tab pages line filler
call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
" Active tab page label
call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
" Not active tab page label
hi! link TabLine TabLineFill

" Match paired bracket under the cursor
call s:HL('MatchParen', s:none, s:bg3, s:bold)

" Highlighted screen columns
call s:HL('ColorColumn',  s:none, s:color_column)

" Concealed element: \lambda → λ
call s:HL('Conceal', s:blue, s:none)

" Line number of CursorLine
call s:HL('CursorLineNr', s:darkblue, s:bg1)

hi! link NonText parasolBg2
hi! link SpecialKey parasolBg2

call s:HL('Visual',    s:none,  s:lightgray)
hi! link VisualNOS Visual

call s:HL('Search',    s:darkblue, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory parasolGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title parasolGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg parasolDarkblueBold
" Current mode message: -- INSERT --
hi! link ModeMsg parasolDarkblueBold
" 'Press enter' prompt and yes/no questions
hi! link Question parasolBlueBold
" Warning messages
hi! link WarningMsg parasolRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

call s:HL('Special', s:blue, s:bg1, s:italicize_strings)

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement parasolRed
" if, then, else, endif, swicth, etc.
hi! link Conditional parasolRed
" for, do, while, etc.
hi! link Repeat parasolRed
" case, default, etc.
hi! link Label parasolRed
" try, catch, throw
hi! link Exception parasolRed

" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword parasolRed

" Variable name
hi! link Identifier parasolBlue
" Function name
hi! link Function parasolFg1

" Generic preprocessor
hi! link PreProc parasolAqua
" Preprocessor #include
hi! link Include parasolAqua
" Preprocessor #define
hi! link Define parasolAqua
" Same as Define
hi! link Macro parasolAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit parasolAqua

" Generic constant
hi! link Constant parasolPurple
" Character constant: 'c', '/n'
hi! link Character parasolPurple
" String constant: "this is a string"
call s:HL('String',  s:green, s:none, s:italicize_strings)
" Boolean constant: TRUE, false
hi! link Boolean parasolPurple
" Number constant: 234, 0xff
hi! link Number parasolPurple
" Floating point constant: 2.3e10
hi! link Float parasolPurple

" Generic type
hi! link Type parasolDarkblue
" static, register, volatile, etc
hi! link StorageClass parasolBlue
" struct, union, enum, etc.
hi! link Structure parasolAqua
" typedef
hi! link Typedef parasolDarkblue

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:darkblue, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

"}}}
" GitGutter: {{{

hi! link GitGutterAdd parasolGreenSign
hi! link GitGutterChange parasolAquaSign
hi! link GitGutterDelete parasolRedSign
hi! link GitGutterChangeDelete parasolAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile parasolGreen
hi! link gitcommitDiscardedFile parasolRed

" }}}
" Signify: {{{

hi! link SignifySignAdd parasolGreenSign
hi! link SignifySignChange parasolAquaSign
hi! link SignifySignDelete parasolRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:darkblue)

hi! link SyntasticErrorSign parasolRedSign
hi! link SyntasticWarningSign parasolDarkblueSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   parasolBlueSign
hi! link SignatureMarkerText parasolPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl parasolBlueSign
hi! link ShowMarksHLu parasolBlueSign
hi! link ShowMarksHLo parasolBlueSign
hi! link ShowMarksHLm parasolBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch parasolDarkblue
hi! link CtrlPNoEntries parasolRed
hi! link CtrlPPrtBase parasolBg2
hi! link CtrlPPrtCursor parasolBlue
hi! link CtrlPLinePre parasolBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket parasolFg3
hi! link StartifyFile parasolFg1
hi! link StartifyNumber parasolBlue
hi! link StartifyPath parasolGray
hi! link StartifySlash parasolGray
hi! link StartifySection parasolDarkblue
hi! link StartifySpecial parasolBg2
hi! link StartifyHeader parasolBlue
hi! link StartifyFooter parasolBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:darkblue[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:blue[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:darkblue)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign parasolRedSign
hi! link ALEWarningSign parasolDarkblueSign
hi! link ALEInfoSign parasolBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail parasolAqua
hi! link DirvishArg parasolDarkblue

" }}}
" Netrw: {{{

hi! link netrwDir parasolAqua
hi! link netrwClassify parasolAqua
hi! link netrwLink parasolGray
hi! link netrwSymLink parasolFg1
hi! link netrwExe parasolDarkblue
hi! link netrwComment parasolGray
hi! link netrwList parasolBlue
hi! link netrwHelpCmd parasolAqua
hi! link netrwCmdSep parasolFg3
hi! link netrwVersion parasolGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir parasolPurple
hi! link NERDTreeDirSlash parasolAqua

hi! link NERDTreeOpenable parasolBlue
hi! link NERDTreeClosable parasolBlue

hi! link NERDTreeFile parasolFg1
hi! link NERDTreeExecFile parasolDarkblue

hi! link NERDTreeUp parasolGray
hi! link NERDTreeCWD parasolGreen
hi! link NERDTreeHelp parasolFg1

hi! link NERDTreeToggleOn parasolGreen
hi! link NERDTreeToggleOff parasolRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded parasolGreen
hi! link diffRemoved parasolRed
hi! link diffChanged parasolAqua

hi! link diffFile parasolBlue
hi! link diffNewFile parasolDarkblue

hi! link diffLine parasolBlue

" }}}
" Html: {{{

hi! link htmlTag parasolBlue
hi! link htmlEndTag parasolBlue

hi! link htmlTagName parasolPurpleBold
hi! link htmlArg parasolAqua

hi! link htmlScriptTag parasolPurple
hi! link htmlTagN parasolFg1
hi! link htmlSpecialTagName parasoPurpleBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar parasolBlue

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag parasolDarkblue
hi! link xmlEndTag parasolPurple
hi! link xmlTagName parasolPurple
hi! link xmlEqual parasolBlue
hi! link docbkKeyword parasolAquaBold

hi! link xmlDocTypeDecl parasolGray
hi! link xmlDocTypeKeyword parasolPurple
hi! link xmlCdataStart parasolGray
hi! link xmlCdataCdata parasolPurple
hi! link dtdFunction parasolGray
hi! link dtdTagName parasolPurple

hi! link xmlAttrib parasolAqua
hi! link xmlProcessingDelim parasolGray
hi! link dtdParamEntityPunct parasolGray
hi! link dtdParamEntityDPunct parasolGray
hi! link xmlAttribPunct parasolGray

hi! link xmlEntity parasolBlue
hi! link xmlEntityPunct parasolBlue
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:gray, s:none, s:bold . s:italicize_comments)

hi! link vimNotation parasolBlue
hi! link vimBracket parasolBlue
hi! link vimMapModKey parasolBlue
hi! link vimFuncSID parasolFg3
hi! link vimSetSep parasolFg3
hi! link vimSep parasolFg3
hi! link vimContinue parasolFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword parasolBlue
hi! link clojureCond parasolBlue
hi! link clojureSpecial parasolBlue
hi! link clojureDefine parasolBlue

hi! link clojureFunc parasolDarkblue
hi! link clojureRepeat parasolDarkblue
hi! link clojureCharacter parasolAqua
hi! link clojureStringEscape parasolAqua
hi! link clojureException parasolRed

hi! link clojureRegexp parasolAqua
hi! link clojureRegexpEscape parasolAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen parasolFg3
hi! link clojureAnonArg parasolDarkblue
hi! link clojureVariable parasolBlue
hi! link clojureMacro parasolBlue

hi! link clojureMeta parasolDarkblue
hi! link clojureDeref parasolDarkblue
hi! link clojureQuote parasolDarkblue
hi! link clojureUnquote parasolDarkblue

" }}}
" C: {{{

hi! link cOperator parasolPurple
hi! link cStructure parasolBlue

" }}}
" Python: {{{

hi! link pythonBuiltin parasolBlue
hi! link pythonBuiltinObj parasolBlue
hi! link pythonBuiltinFunc parasolBlue
hi! link pythonFunction parasolAqua
hi! link pythonDecorator parasolRed
hi! link pythonInclude parasolBlue
hi! link pythonImport parasolBlue
hi! link pythonRun parasolBlue
hi! link pythonCoding parasolBlue
hi! link pythonOperator parasolRed
hi! link pythonException parasolRed
hi! link pythonExceptions parasolPurple
hi! link pythonBoolean parasolPurple
hi! link pythonDot parasolFg3
hi! link pythonConditional parasolRed
hi! link pythonRepeat parasolRed
hi! link pythonDottedName parasolGreenBold

" }}}
" CSS: {{{

hi! link cssBraces parasolBlue
hi! link cssFunctionName parasolDarkblue
hi! link cssIdentifier parasolBlue
hi! link cssClassName parasolGreen
hi! link cssColor parasolBlue
hi! link cssSelectorOp parasolBlue
hi! link cssSelectorOp2 parasolBlue
hi! link cssImportant parasolGreen
hi! link cssVendor parasolFg1

hi! link cssTextProp parasolAqua
hi! link cssAnimationProp parasolAqua
hi! link cssUIProp parasolDarkblue
hi! link cssTransformProp parasolAqua
hi! link cssTransitionProp parasolAqua
hi! link cssPrintProp parasolAqua
hi! link cssPositioningProp parasolDarkblue
hi! link cssBoxProp parasolAqua
hi! link cssFontDescriptorProp parasolAqua
hi! link cssFlexibleBoxProp parasolAqua
hi! link cssBorderOutlineProp parasolAqua
hi! link cssBackgroundProp parasolAqua
hi! link cssMarginProp parasolAqua
hi! link cssListProp parasolAqua
hi! link cssTableProp parasolAqua
hi! link cssFontProp parasolAqua
hi! link cssPaddingProp parasolAqua
hi! link cssDimensionProp parasolAqua
hi! link cssRenderProp parasolAqua
hi! link cssColorProp parasolAqua
hi! link cssGeneratedContentProp parasolAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces parasolFg4
hi! link javaScriptFunction parasolPurple
hi! link javaScriptIdentifier parasolRed
hi! link javaScriptMember parasolBlue
hi! link javaScriptNumber parasolPink
hi! link javaScriptNull parasolPink
hi! link javaScriptParens parasolFg4

" }}}
" YAJS: {{{

hi! link javascriptImport parasolPurple
hi! link javascriptExport parasolPurple
hi! link javascriptClassKeyword parasolPurple
hi! link javascriptClassExtends parasolPurple
hi! link javascriptDefault parasolPurple

hi! link javascriptClassName parasolPurple
hi! link javascriptClassSuperName parasolPurple
hi! link javascriptGlobal parasolPurple

hi! link javascriptEndColons parasolBlue
hi! link javascriptFuncArg parasolBlue
hi! link javascriptGlobalMethod parasolBlue
hi! link javascriptNodeGlobal parasolBlue
hi! link javascriptBOMWindowProp parasolBlue
hi! link javascriptArrayMethod parasolBlue
hi! link javascriptArrayStaticMethod parasolBlue
hi! link javascriptCacheMethod parasolBlue
hi! link javascriptDateMethod parasolBlue
hi! link javascriptMathStaticMethod parasolBlue

hi! link javascriptURLUtilsProp parasolFg1
hi! link javascriptBOMNavigatorProp parasolFg1
hi! link javascriptDOMDocMethod parasolFg1
hi! link javascriptDOMDocProp parasolFg1
hi! link javascriptBOMLocationMethod parasolFg1
hi! link javascriptBOMWindowMethod parasolFg1
hi! link javascriptStringMethod parasolFg1

hi! link javascriptVariable parasolBlue
hi! link javascriptIdentifier parasolBlue
hi! link javascriptClassSuper parasolBlue

hi! link javascriptFuncKeyword parasolAqua
hi! link javascriptAsyncFunc parasolAqua
hi! link javascriptClassStatic parasolBlue

hi! link javascriptOperator parasolRed
hi! link javascriptForOperator parasolRed
hi! link javascriptYield parasolRed
hi! link javascriptExceptions parasolRed
hi! link javascriptMessage parasolRed

hi! link javascriptTemplateSB parasolAqua
hi! link javascriptTemplateSubstitution parasolFg1

hi! link javascriptLabel parasolFg1
hi! link javascriptObjectLabel parasolFg1
hi! link javascriptPropertyName parasolFg1

hi! link javascriptLogicSymbols parasolFg1
hi! link javascriptArrowFunc parasolBlue

hi! link javascriptDocParamName parasolFg4
hi! link javascriptDocTags parasolFg4
hi! link javascriptDocNotation parasolFg4
hi! link javascriptDocParamType parasolFg4
hi! link javascriptDocNamedParamType parasolFg4

hi! link javascriptBrackets parasolFg1
hi! link javascriptDOMElemAttrs parasolFg1
hi! link javascriptDOMEventMethod parasolFg1
hi! link javascriptDOMNodeMethod parasolFg1
hi! link javascriptDOMStorageMethod parasolFg1
hi! link javascriptHeadersMethod parasolFg1

hi! link javascriptAsyncFuncKeyword parasolRed
hi! link javascriptAwaitFuncKeyword parasolRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword parasolPurple
hi! link jsExtendsKeyword parasolPurple
hi! link jsExportDefault parasolPurple
hi! link jsTemplateBraces parasolPurple
hi! link jsGlobalNodeObjects parasolFg1
hi! link jsGlobalObjects parasolFg1
hi! link jsFunction parasolPurple
hi! link jsFuncParens parasolFg3
hi! link jsParens parasolFg3
hi! link jsNull parasolPurple
hi! link jsUndefined parasolPurple
hi! link jsClassDefinition parasolPurple

" }}}
" TypeScript: {{{

hi! link typeScriptReserved parasolAqua
hi! link typeScriptLabel parasolAqua
hi! link typeScriptFuncKeyword parasolAqua
hi! link typeScriptIdentifier parasolBlue
hi! link typeScriptBraces parasolFg1
hi! link typeScriptEndColons parasolFg1
hi! link typeScriptDOMObjects parasolFg1
hi! link typeScriptAjaxMethods parasolFg1
hi! link typeScriptLogicSymbols parasolFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects parasolFg1
hi! link typeScriptParens parasolFg3
hi! link typeScriptOpSymbols parasolFg3
hi! link typeScriptHtmlElemProperties parasolFg1
hi! link typeScriptNull parasolPurple
hi! link typeScriptInterpolationDelimiter parasolAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword parasolAqua
hi! link purescriptModuleName parasolFg1
hi! link purescriptWhere parasolAqua
hi! link purescriptDelimiter parasolFg4
hi! link purescriptType parasolFg1
hi! link purescriptImportKeyword parasolAqua
hi! link purescriptHidingKeyword parasolAqua
hi! link purescriptAsKeyword parasolAqua
hi! link purescriptStructure parasolAqua
hi! link purescriptOperator parasolBlue

hi! link purescriptTypeVar parasolFg1
hi! link purescriptConstructor parasolFg1
hi! link purescriptFunction parasolFg1
hi! link purescriptConditional parasolBlue
hi! link purescriptBacktick parasolBlue

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp parasolFg3
hi! link coffeeSpecialOp parasolFg3
hi! link coffeeCurly parasolBlue
hi! link coffeeParen parasolFg3
hi! link coffeeBracket parasolBlue

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter parasolGreen
hi! link rubyInterpolationDelimiter parasolAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier parasolRed
hi! link objcDirective parasolBlue

" }}}
" Go: {{{

hi! link goDirective parasolAqua
hi! link goConstants parasolPurple
hi! link goDeclaration parasolRed
hi! link goDeclType parasolBlue
hi! link goBuiltins parasolBlue

" }}}
" Lua: {{{

hi! link luaIn parasolRed
hi! link luaFunction parasolAqua
hi! link luaTable parasolBlue

" }}}
" MoonScript: {{{

hi! link moonSpecialOp parasolFg3
hi! link moonExtendedOp parasolFg3
hi! link moonFunction parasolFg3
hi! link moonObject parasolPink

" }}}
" Java: {{{

hi! link javaAnnotation parasolBlue
hi! link javaDocTags parasolAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen parasolFg3
hi! link javaParen1 parasolFg3
hi! link javaParen2 parasolFg3
hi! link javaParen3 parasolFg3
hi! link javaParen4 parasolFg3
hi! link javaParen5 parasolFg3
hi! link javaOperator parasolBlue

hi! link javaVarArg parasolGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter parasolGreen
hi! link elixirInterpolationDelimiter parasolAqua

hi! link elixirModuleDeclaration parasolPink

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition parasolFg1
hi! link scalaCaseFollowing parasolFg1
hi! link scalaCapitalWord parasolFg1
hi! link scalaTypeExtension parasolFg1

hi! link scalaKeyword parasolRed
hi! link scalaKeywordModifier parasolRed

hi! link scalaSpecial parasolAqua
hi! link scalaOperator parasolFg1

hi! link scalaTypeDeclaration parasolPink
hi! link scalaTypeTypePostDeclaration parasolPink

hi! link scalaInstanceDeclaration parasolFg1
hi! link scalaInterpolation parasolAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 parasolGreenBold
hi! link markdownH2 parasolGreenBold
hi! link markdownH3 parasolPinkBold
hi! link markdownH4 parasolPinkBold
hi! link markdownH5 parasolPink
hi! link markdownH6 parasolPink

hi! link markdownCode parasolAqua
hi! link markdownCodeBlock parasolAqua
hi! link markdownCodeDelimiter parasolAqua

hi! link markdownBlockquote parasolGray
hi! link markdownListMarker parasolGray
hi! link markdownOrderedListMarker parasolGray
hi! link markdownRule parasolGray
hi! link markdownHeadingRule parasolGray

hi! link markdownUrlDelimiter parasolFg3
hi! link markdownLinkDelimiter parasolFg3
hi! link markdownLinkTextDelimiter parasolFg3

hi! link markdownHeadingDelimiter parasolBlue
hi! link markdownUrl parasolPurple
hi! link markdownUrlTitleDelimiter parasolGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

hi! link haskellType parasolFg1
hi! link haskellIdentifier parasolFg1
hi! link haskellSeparator parasolFg1
hi! link haskellDelimiter parasolFg4
hi! link haskellOperators parasolBlue
"
hi! link haskellBacktick parasolBlue
hi! link haskellStatement parasolBlue
hi! link haskellConditional parasolBlue

hi! link haskellLet parasolAqua
hi! link haskellDefault parasolAqua
hi! link haskellWhere parasolAqua
hi! link haskellBottom parasolAqua
hi! link haskellBlockKeywords parasolAqua
hi! link haskellImportKeywords parasolAqua
hi! link haskellDeclKeyword parasolAqua
hi! link haskellDeriving parasolAqua
hi! link haskellAssocType parasolAqua

hi! link haskellNumber parasolPurple
hi! link haskellPragma parasolPurple

hi! link haskellString parasolGreen
hi! link haskellChar parasolGreen

" }}}
" Json: {{{

hi! link jsonKeyword parasolGreen
hi! link jsonQuote parasolGreen
hi! link jsonBraces parasolFg1
hi! link jsonString parasolFg1

" }}}
