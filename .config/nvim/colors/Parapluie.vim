" Parapluie
hi clear

if exists("syntax on")
syntax reset
endif

let g:colors_name = "Parapluie"
set background=dark

let g:parapluie_bold=1
let g:parapluie_italic=1
let g:parapluie_italic=0
let g:parapluie_undercurl=1
let g:parapluie_underline=1
let g:parapluie_inverse=1

" setup palette dictionary
let s:color = {}

" fill it with absolute colors
let s:color.dark0       = ['#222623', 235]     " 40-40-40
let s:color.dark1       = ['#222623', 237]     " 60-56-54
let s:color.dark2       = ['#222623', 239]     " 80-73-69
let s:color.dark3       = ['#222623', 241]     " 102-92-84
let s:color.dark4       = ['#222623', 243]     " 124-111-100

let s:color.gray_245    = ['#5F5F8F', 245]     " 146-131-116
let s:color.gray_244    = ['#5F5F8F', 244]     " 146-131-116

" hi guibg=#eaeaff
let s:color.light0      = ['#eaeaff', 229]     " 253-244-193
let s:color.light1      = s:color.light0
let s:color.light2      = s:color.light0
let s:color.light3      = s:color.light0
let s:color.light4      = s:color.light0

" hi guibg=#b363ff
let s:color1    = ['#b363ff', 124]
" hi guibg=#b49bff
let s:color2  = ['#b49bff', 106]
" hi guibg=#77e2f9
let s:color3 = ['#77e2f9', 172]
" hi guibg=#07a8ff
let s:color4   = ['#07a8ff', 66]
" hi guibg=#9855fc
let s:color5 = ['#9855fc', 132]
" hi guibg=#80A5E9
let s:color6   = ['#80A5E9', 72]
" hi guibg=#90accc
let s:color7   = ['#90accc', 72]

let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
let s:bg0  = s:color.dark0
let s:bg1  = s:color.dark1
let s:bg2  = s:color.dark2
let s:bg3  = s:color.dark3
let s:bg4  = s:color.dark4

let s:gray = s:color.gray_244

let s:fg0 = s:color.light0
let s:fg1 = s:color.light1
let s:fg2 = s:color.light2
let s:fg3 = s:color.light3
let s:fg4 = s:color.light4

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

let s:hls_cursor = s:color4
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
call s:HL('parapluieFg0', s:fg0)
call s:HL('parapluieFg1', s:fg1)
call s:HL('parapluieFg2', s:fg2)
call s:HL('parapluieFg3', s:fg3)
call s:HL('parapluieFg4', s:fg4)
call s:HL('parapluieGray', s:gray)
call s:HL('parapluieBg0', s:bg0)
call s:HL('parapluieBg1', s:bg1)
call s:HL('parapluieBg2', s:bg2)
call s:HL('parapluieBg3', s:bg3)
call s:HL('parapluieBg4', s:bg4)

call s:HL('parapluieColor1', s:color1)
call s:HL('parapluieColor1Bold', s:color1, s:none, s:bold)
call s:HL('parapluiecolor2', s:color2)
call s:HL('parapluiecolor2Bold', s:color2, s:none, s:bold)
call s:HL('parapluiecolor3', s:color3)
call s:HL('parapluiecolor3Bold', s:color3, s:none, s:bold)
call s:HL('parapluieColor4', s:color4)
call s:HL('parapluieColor4Bold', s:color4, s:none, s:bold)
call s:HL('parapluieColor5', s:color5)
call s:HL('parapluieColor5Bold', s:color5, s:none, s:bold)
call s:HL('parapluieColor6', s:color6)
call s:HL('parapluieColor6Bold', s:color6, s:none, s:bold)
call s:HL('parapluieColor7', s:color7)
call s:HL('parapluieColor7Bold', s:color7, s:none, s:bold)

call s:HL('parapluieColor1Sign', s:color1, s:sign_column, s:invert_signs)
call s:HL('parapluiecolor2Sign', s:color2, s:sign_column, s:invert_signs)
call s:HL('parapluiecolor3Sign', s:color3, s:sign_column, s:invert_signs)
call s:HL('parapluieColor7Sign', s:color7, s:sign_column, s:invert_signs)
call s:HL('parapluieColor4Sign', s:color4, s:sign_column, s:invert_signs)
call s:HL('parapluieColor5Sign', s:color5, s:sign_column, s:invert_signs)
call s:HL('parapluieColor6Sign', s:color6, s:sign_column, s:invert_signs)

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
call s:HL('TabLineSel', s:color2, s:bg1, s:invert_tabline)
" Not active tab page label
hi! link TabLine TabLineFill

" Match paired bracket under the cursor
call s:HL('MatchParen', s:none, s:bg3, s:bold)

" Highlighted screen columns
call s:HL('ColorColumn',  s:none, s:color_column)

" Concealed element: \lambda → λ
call s:HL('Conceal', s:color4, s:none)

" Line number of CursorLine
call s:HL('CursorLineNr', s:color7, s:bg1)

hi! link NonText parapluieBg2
hi! link SpecialKey parapluieBg2

call s:HL('Visual',    s:bg1,  s:color2)
hi! link VisualNOS Visual

call s:HL('Search',    s:color7, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:color4, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:color4, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory parapluiecolor2Bold

" Titles for output from :set all, :autocmd, etc.
hi! link Title parapluiecolor2Bold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:color1, s:bold)
" More prompt: -- More --
hi! link MoreMsg parapluieColor7Bold
" Current mode message: -- INSERT --
hi! link ModeMsg parapluieColor7Bold
" 'Press enter' prompt and yes/no questions
hi! link Question parapluieColor4Bold
" Warning messages
hi! link WarningMsg parapluieColor1Bold

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

call s:HL('Special', s:color4, s:bg1, s:italicize_strings)

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:color1, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement parapluieColor1
" if, then, else, endif, swicth, etc.
hi! link Conditional parapluieColor1
" for, do, while, etc.
hi! link Repeat parapluieColor1
" case, default, etc.
hi! link Label parapluieColor1
" try, catch, throw
hi! link Exception parapluieColor1
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword parapluieColor1

" Variable name
hi! link Identifier parapluieColor4
" Function name
hi! link Function parapluieFg1

" Generic preprocessor
hi! link PreProc parapluieColor6
" Preprocessor #include
hi! link Include parapluieColor6
" Preprocessor #define
hi! link Define parapluieColor6
" Same as Define
hi! link Macro parapluieColor6
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit parapluieColor6

" Generic constant
hi! link Constant parapluieColor5
" Character constant: 'c', '/n'
hi! link Character parapluieColor5
" String constant: "this is a string"
call s:HL('String',  s:color2, s:none, s:italicize_strings)
" Boolean constant: TRUE, false
hi! link Boolean parapluieColor5
" Number constant: 234, 0xff
hi! link Number parapluieColor5
" Floating point constant: 2.3e10
hi! link Float parapluieColor5

" Generic type
hi! link Type parapluieColor7
" static, register, volatile, etc
hi! link StorageClass parapluieColor4
" struct, union, enum, etc.
hi! link Structure parapluieColor6
" typedef
hi! link Typedef parapluieColor7

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:color1, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:color2, s:bg0, s:inverse)
call s:HL('DiffChange', s:color6, s:bg0, s:inverse)
call s:HL('DiffText',   s:color7, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:color1)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:color4)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:color6)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:color5)
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

hi! link GitGutterAdd parapluiecolor2Sign
hi! link GitGutterChange parapluieColor6Sign
hi! link GitGutterDelete parapluieColor1Sign
hi! link GitGutterChangeDelete parapluieColor6Sign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile parapluiecolor2
hi! link gitcommitDiscardedFile parapluieColor1

" }}}
" Signify: {{{

hi! link SignifySignAdd parapluiecolor2Sign
hi! link SignifySignChange parapluieColor6Sign
hi! link SignifySignDelete parapluieColor1Sign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:color1)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:color7)

hi! link SyntasticErrorSign parapluieColor1Sign
hi! link SyntasticWarningSign parapluieColor7Sign

" }}}
" Signature: {{{
hi! link SignatureMarkText   parapluieColor4Sign
hi! link SignatureMarkerText parapluieColor5Sign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl parapluieColor4Sign
hi! link ShowMarksHLu parapluieColor4Sign
hi! link ShowMarksHLo parapluieColor4Sign
hi! link ShowMarksHLm parapluieColor4Sign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch parapluieColor7
hi! link CtrlPNoEntries parapluieColor1
hi! link CtrlPPrtBase parapluieBg2
hi! link CtrlPPrtCursor parapluieColor4
hi! link CtrlPLinePre parapluieBg2

call s:HL('CtrlPMode1', s:color4, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:color4, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket parapluieFg3
hi! link StartifyFile parapluieFg1
hi! link StartifyNumber parapluieColor4
hi! link StartifyPath parapluieGray
hi! link StartifySlash parapluieGray
hi! link StartifySection parapluieColor7
hi! link StartifySpecial parapluieBg2
hi! link StartifyHeader parapluieColor4
hi! link StartifyFooter parapluieBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:color1[0], s:color2[0], s:color7[0],
  \ s:color4[0], s:color5[0], s:color6[0], s:fg4[0],
  \ s:bg0[0], s:color1[0], s:color2[0], s:color4[0],
  \ s:color4[0], s:color5[0], s:color6[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:color1)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:color7)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:color4)

hi! link ALEErrorSign parapluieColor1Sign
hi! link ALEWarningSign parapluieColor7Sign
hi! link ALEInfoSign parapluieColor4Sign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail parapluieColor6
hi! link DirvishArg parapluieColor7

" }}}
" Netrw: {{{

hi! link netrwDir parapluieColor6
hi! link netrwClassify parapluieColor6
hi! link netrwLink parapluieGray
hi! link netrwSymLink parapluieFg1
hi! link netrwExe parapluieColor7
hi! link netrwComment parapluieGray
hi! link netrwList parapluieColor4
hi! link netrwHelpCmd parapluieColor6
hi! link netrwCmdSep parapluieFg3
hi! link netrwVersion parapluiecolor2

" }}}
" NERDTree: {{{

hi! link NERDTreeDir parapluieColor5
hi! link NERDTreeDirSlash parapluieColor6

hi! link NERDTreeOpenable parapluieColor4
hi! link NERDTreeClosable parapluieColor4

hi! link NERDTreeFile parapluieFg1
hi! link NERDTreeExecFile parapluieColor7

hi! link NERDTreeUp parapluieGray
hi! link NERDTreeCWD parapluiecolor2
hi! link NERDTreeHelp parapluieFg1

hi! link NERDTreeToggleOn parapluiecolor2
hi! link NERDTreeToggleOff parapluieColor1

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded parapluiecolor2
hi! link diffRemoved parapluieColor1
hi! link diffChanged parapluieColor6

hi! link diffFile parapluieColor4
hi! link diffNewFile parapluieColor7

hi! link diffLine parapluieColor4

" }}}
" Html: {{{

hi! link htmlTag parapluieColor4
hi! link htmlEndTag parapluieColor4

hi! link htmlTagName parapluieColor5Bold
hi! link htmlArg parapluieColor6

hi! link htmlScriptTag parapluieColor5
hi! link htmlTagN parapluieFg1
hi! link htmlSpecialTagName parasoColor5Bold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar parapluieColor4

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag parapluieColor7
hi! link xmlEndTag parapluieColor5
hi! link xmlTagName parapluieColor5
hi! link xmlEqual parapluieColor4
hi! link docbkKeyword parapluieColor6Bold

hi! link xmlDocTypeDecl parapluieGray
hi! link xmlDocTypeKeyword parapluieColor5
hi! link xmlCdataStart parapluieGray
hi! link xmlCdataCdata parapluieColor5
hi! link dtdFunction parapluieGray
hi! link dtdTagName parapluieColor5

hi! link xmlAttrib parapluieColor6
hi! link xmlProcessingDelim parapluieGray
hi! link dtdParamEntityPunct parapluieGray
hi! link dtdParamEntityDPunct parapluieGray
hi! link xmlAttribPunct parapluieGray

hi! link xmlEntity parapluieColor4
hi! link xmlEntityPunct parapluieColor4
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:gray, s:none, s:bold . s:italicize_comments)

hi! link vimNotation parapluieColor4
hi! link vimBracket parapluieColor4
hi! link vimMapModKey parapluieColor4
hi! link vimFuncSID parapluieFg3
hi! link vimSetSep parapluieFg3
hi! link vimSep parapluieFg3
hi! link vimContinue parapluieFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword parapluieColor4
hi! link clojureCond parapluieColor4
hi! link clojureSpecial parapluieColor4
hi! link clojureDefine parapluieColor4

hi! link clojureFunc parapluieColor7
hi! link clojureRepeat parapluieColor7
hi! link clojureCharacter parapluieColor6
hi! link clojureStringEscape parapluieColor6
hi! link clojureException parapluieColor1

hi! link clojureRegexp parapluieColor6
hi! link clojureRegexpEscape parapluieColor6
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen parapluieFg3
hi! link clojureAnonArg parapluieColor7
hi! link clojureVariable parapluieColor4
hi! link clojureMacro parapluieColor4

hi! link clojureMeta parapluieColor7
hi! link clojureDeref parapluieColor7
hi! link clojureQuote parapluieColor7
hi! link clojureUnquote parapluieColor7

" }}}
" C: {{{

hi! link cOperator parapluieColor5
hi! link cStructure parapluieColor4

" }}}
" Python: {{{

hi! link pythonBuiltin parapluieColor4
hi! link pythonBuiltinObj parapluieColor4
hi! link pythonBuiltinFunc parapluieColor4
hi! link pythonFunction parapluieColor6
hi! link pythonDecorator parapluieColor1
hi! link pythonInclude parapluieColor4
hi! link pythonImport parapluieColor4
hi! link pythonRun parapluieColor4
hi! link pythonCoding parapluieColor4
hi! link pythonOperator parapluieColor1
hi! link pythonException parapluieColor1
hi! link pythonExceptions parapluieColor5
hi! link pythonBoolean parapluieColor5
hi! link pythonDot parapluieFg3
hi! link pythonConditional parapluieColor1
hi! link pythonRepeat parapluieColor1
hi! link pythonDottedName parapluiecolor2Bold

" }}}
" CSS: {{{

hi! link cssBraces parapluieColor4
hi! link cssFunctionName parapluieColor7
hi! link cssIdentifier parapluieColor4
hi! link cssClassName parapluiecolor2
hi! link cssColor parapluieColor4
hi! link cssSelectorOp parapluieColor4
hi! link cssSelectorOp2 parapluieColor4
hi! link cssImportant parapluiecolor2
hi! link cssVendor parapluieFg1

hi! link cssTextProp parapluieColor6
hi! link cssAnimationProp parapluieColor6
hi! link cssUIProp parapluieColor7
hi! link cssTransformProp parapluieColor6
hi! link cssTransitionProp parapluieColor6
hi! link cssPrintProp parapluieColor6
hi! link cssPositioningProp parapluieColor7
hi! link cssBoxProp parapluieColor6
hi! link cssFontDescriptorProp parapluieColor6
hi! link cssFlexibleBoxProp parapluieColor6
hi! link cssBorderOutlineProp parapluieColor6
hi! link cssBackgroundProp parapluieColor6
hi! link cssMarginProp parapluieColor6
hi! link cssListProp parapluieColor6
hi! link cssTableProp parapluieColor6
hi! link cssFontProp parapluieColor6
hi! link cssPaddingProp parapluieColor6
hi! link cssDimensionProp parapluieColor6
hi! link cssRenderProp parapluieColor6
hi! link cssColorProp parapluieColor6
hi! link cssGeneratedContentProp parapluieColor6

" }}}
" JavaScript: {{{

hi! link javaScriptBraces parapluieColor7
hi! link javaScriptFunction parapluieColor5
hi! link javaScriptIdentifier parapluieColor1
hi! link javaScriptMember parapluieColor4
hi! link javaScriptNumber parapluiecolor3
hi! link javaScriptNull parapluiecolor3
hi! link javaScriptParens parapluieFg3

" }}}
" YAJS: {{{

hi! link javascriptImport parapluieColor5
hi! link javascriptExport parapluieColor5
hi! link javascriptClassKeyword parapluieColor5
hi! link javascriptClassExtends parapluieColor5
hi! link javascriptDefault parapluieColor5

hi! link javascriptClassName parapluieColor5
hi! link javascriptClassSuperName parapluieColor5
hi! link javascriptGlobal parapluieColor5

hi! link javascriptEndColons parapluieColor4
hi! link javascriptFuncArg parapluieColor4
hi! link javascriptGlobalMethod parapluieColor4
hi! link javascriptNodeGlobal parapluieColor4
hi! link javascriptBOMWindowProp parapluieColor4
hi! link javascriptArrayMethod parapluieColor4
hi! link javascriptArrayStaticMethod parapluieColor4
hi! link javascriptCacheMethod parapluieColor4
hi! link javascriptDateMethod parapluieColor4
hi! link javascriptMathStaticMethod parapluieColor4

hi! link javascriptURLUtilsProp parapluieFg1
hi! link javascriptBOMNavigatorProp parapluieFg1
hi! link javascriptDOMDocMethod parapluieFg1
hi! link javascriptDOMDocProp parapluieFg1
hi! link javascriptBOMLocationMethod parapluieFg1
hi! link javascriptBOMWindowMethod parapluieFg1
hi! link javascriptStringMethod parapluieFg1

hi! link javascriptVariable parapluieColor4
hi! link javascriptIdentifier parapluieColor4
hi! link javascriptClassSuper parapluieColor4

hi! link javascriptFuncKeyword parapluieColor6
hi! link javascriptAsyncFunc parapluieColor6
hi! link javascriptClassStatic parapluieColor4

hi! link javascriptOperator parapluieColor1
hi! link javascriptForOperator parapluieColor1
hi! link javascriptYield parapluieColor1
hi! link javascriptExceptions parapluieColor1
hi! link javascriptMessage parapluieColor1

hi! link javascriptTemplateSB parapluieColor6
hi! link javascriptTemplateSubstitution parapluieFg1

hi! link javascriptLabel parapluieFg1
hi! link javascriptObjectLabel parapluieFg1
hi! link javascriptPropertyName parapluieFg1

hi! link javascriptLogicSymbols parapluieFg1
hi! link javascriptArrowFunc parapluieColor4

hi! link javascriptDocParamName parapluieFg4
hi! link javascriptDocTags parapluieFg4
hi! link javascriptDocNotation parapluieFg4
hi! link javascriptDocParamType parapluieFg4
hi! link javascriptDocNamedParamType parapluieFg4

hi! link javascriptBrackets parapluieFg1
hi! link javascriptDOMElemAttrs parapluieFg1
hi! link javascriptDOMEventMethod parapluieFg1
hi! link javascriptDOMNodeMethod parapluieFg1
hi! link javascriptDOMStorageMethod parapluieFg1
hi! link javascriptHeadersMethod parapluieFg1

hi! link javascriptAsyncFuncKeyword parapluieColor1
hi! link javascriptAwaitFuncKeyword parapluieColor1

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword parapluieColor5
hi! link jsExtendsKeyword parapluieColor5
hi! link jsExportDefault parapluieColor5
hi! link jsTemplateBraces parapluieColor5
hi! link jsGlobalNodeObjects parapluieFg1
hi! link jsGlobalObjects parapluieFg1
hi! link jsFunction parapluieColor5
hi! link jsFuncParens parapluieFg3
hi! link jsParens parapluieFg3
hi! link jsNull parapluieColor5
hi! link jsUndefined parapluieColor5
hi! link jsClassDefinition parapluieColor5

" }}}
" TypeScript: {{{

hi! link typeScriptReserved parapluieColor6
hi! link typeScriptLabel parapluieColor6
hi! link typeScriptFuncKeyword parapluieColor6
hi! link typeScriptIdentifier parapluieColor4
hi! link typeScriptBraces parapluieFg1
hi! link typeScriptEndColons parapluieFg1
hi! link typeScriptDOMObjects parapluieFg1
hi! link typeScriptAjaxMethods parapluieFg1
hi! link typeScriptLogicSymbols parapluieFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects parapluieFg1
hi! link typeScriptParens parapluieFg3
hi! link typeScriptOpSymbols parapluieFg3
hi! link typeScriptHtmlElemProperties parapluieFg1
hi! link typeScriptNull parapluieColor5
hi! link typeScriptInterpolationDelimiter parapluieColor6

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword parapluieColor6
hi! link purescriptModuleName parapluieFg1
hi! link purescriptWhere parapluieColor6
hi! link purescriptDelimiter parapluieFg4
hi! link purescriptType parapluieFg1
hi! link purescriptImportKeyword parapluieColor6
hi! link purescriptHidingKeyword parapluieColor6
hi! link purescriptAsKeyword parapluieColor6
hi! link purescriptStructure parapluieColor6
hi! link purescriptOperator parapluieColor4

hi! link purescriptTypeVar parapluieFg1
hi! link purescriptConstructor parapluieFg1
hi! link purescriptFunction parapluieFg1
hi! link purescriptConditional parapluieColor4
hi! link purescriptBacktick parapluieColor4

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp parapluieFg3
hi! link coffeeSpecialOp parapluieFg3
hi! link coffeeCurly parapluieColor4
hi! link coffeeParen parapluieFg3
hi! link coffeeBracket parapluieColor4

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter parapluiecolor2
hi! link rubyInterpolationDelimiter parapluieColor6

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier parapluieColor1
hi! link objcDirective parapluieColor4

" }}}
" Go: {{{

hi! link goDirective parapluieColor6
hi! link goConstants parapluieColor5
hi! link goDeclaration parapluieColor1
hi! link goDeclType parapluieColor4
hi! link goBuiltins parapluieColor4

" }}}
" Lua: {{{

hi! link luaIn parapluieColor1
hi! link luaFunction parapluieColor6
hi! link luaTable parapluieColor4

" }}}
" MoonScript: {{{

hi! link moonSpecialOp parapluieFg3
hi! link moonExtendedOp parapluieFg3
hi! link moonFunction parapluieFg3
hi! link moonObject parapluiecolor3

" }}}
" Java: {{{

hi! link javaAnnotation parapluieColor4
hi! link javaDocTags parapluieColor6
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen parapluieFg3
hi! link javaParen1 parapluieFg3
hi! link javaParen2 parapluieFg3
hi! link javaParen3 parapluieFg3
hi! link javaParen4 parapluieFg3
hi! link javaParen5 parapluieFg3
hi! link javaOperator parapluieColor4

hi! link javaVarArg parapluiecolor2

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter parapluiecolor2
hi! link elixirInterpolationDelimiter parapluieColor6

hi! link elixirModuleDeclaration parapluiecolor3

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition parapluieFg1
hi! link scalaCaseFollowing parapluieFg1
hi! link scalaCapitalWord parapluieFg1
hi! link scalaTypeExtension parapluieFg1

hi! link scalaKeyword parapluieColor1
hi! link scalaKeywordModifier parapluieColor1

hi! link scalaSpecial parapluieColor6
hi! link scalaOperator parapluieFg1

hi! link scalaTypeDeclaration parapluiecolor3
hi! link scalaTypeTypePostDeclaration parapluiecolor3

hi! link scalaInstanceDeclaration parapluieFg1
hi! link scalaInterpolation parapluieColor6

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 parapluiecolor2Bold
hi! link markdownH2 parapluiecolor2Bold
hi! link markdownH3 parapluiecolor3Bold
hi! link markdownH4 parapluiecolor3Bold
hi! link markdownH5 parapluiecolor3
hi! link markdownH6 parapluiecolor3

hi! link markdownCode parapluieColor6
hi! link markdownCodeBlock parapluieColor6
hi! link markdownCodeDelimiter parapluieColor6

hi! link markdownBlockquote parapluieGray
hi! link markdownListMarker parapluieGray
hi! link markdownOrderedListMarker parapluieGray
hi! link markdownRule parapluieGray
hi! link markdownHeadingRule parapluieGray

hi! link markdownUrlDelimiter parapluieFg3
hi! link markdownLinkDelimiter parapluieFg3
hi! link markdownLinkTextDelimiter parapluieFg3

hi! link markdownHeadingDelimiter parapluieColor4
hi! link markdownUrl parapluieColor5
hi! link markdownUrlTitleDelimiter parapluiecolor2

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

hi! link haskellType parapluieFg1
hi! link haskellIdentifier parapluieFg1
hi! link haskellSeparator parapluieFg1
hi! link haskellDelimiter parapluieFg4
hi! link haskellOperators parapluieColor4
"
hi! link haskellBacktick parapluieColor4
hi! link haskellStatement parapluieColor4
hi! link haskellConditional parapluieColor4

hi! link haskellLet parapluieColor6
hi! link haskellDefault parapluieColor6
hi! link haskellWhere parapluieColor6
hi! link haskellBottom parapluieColor6
hi! link haskellBlockKeywords parapluieColor6
hi! link haskellImportKeywords parapluieColor6
hi! link haskellDeclKeyword parapluieColor6
hi! link haskellDeriving parapluieColor6
hi! link haskellAssocType parapluieColor6

hi! link haskellNumber parapluieColor5
hi! link haskellPragma parapluieColor5

hi! link haskellString parapluiecolor2
hi! link haskellChar parapluiecolor2

" }}}
" Json: {{{

hi! link jsonKeyword parapluiecolor2
hi! link jsonQuote parapluiecolor2
hi! link jsonBraces parapluieFg1
hi! link jsonString parapluieFg1

" }}}
