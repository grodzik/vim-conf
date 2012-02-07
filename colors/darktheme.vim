set t_Co=256
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name = "grodzik"

hi           CursorLine                    ctermbg=236               cterm=None      guibg=#303030
hi           CursorColumn                  ctermbg=236               cterm=None      guibg=#303030
hi           ColorColumn                   ctermbg=240               cterm=None      guibg=#585858
"            Default                       Colors
hi           Normal                        ctermfg=250               ctermbg=235     guifg=#bcbcbc   guibg=#262626
hi           NonText                       ctermfg=236               ctermbg=236     cterm=none      guifg=#303030   guibg=#303030
hi           Cursor                        ctermbg=250               guibg=#bcbcbc
hi           ICursor                       ctermbg=250               guibg=#bcbcbc

"Invisible   character                     colors
highlight    NonText                       ctermfg=33                guifg=#0087ff
highlight    SpecialKey                    ctermfg=33                guifg=#0087ff

"            Search
hi           Search                        ctermfg=255               ctermbg=26      guifg=#eeeeee   guibg=#005fd7
hi           IncSearch                     ctermbg=255               ctermfg=26      guifg=#005fd7   guibg=#eeeeee

"            Window                        Elements
hi           StatusLine                    ctermfg=250               ctermbg=236     cterm=none      guifg=#bcbcbc   guibg=#303030
hi           StatusLineNC                  ctermfg=250               ctermbg=236     cterm=none      guifg=#bcbcbc   guibg=#303030
hi           VertSplit                     ctermfg=240               ctermbg=102     cterm=none      guifg=#585858   guibg=#878787
hi           Visual                        ctermbg=0                 guibg=#000000
hi           MoreMsg                       ctermfg=74                guifg=#5fafd7
hi           Question                      ctermfg=113               cterm=none      guifg=#87d75f
hi           WildMenu                      ctermfg=7                 ctermbg=233     guifg=#c0c0c0   guibg=#121212
"hi          LineNr                        ctermfg=238               ctermbg=0       guifg=#444444   guibg=#000000
hi           SignColumn                    ctermbg=235               guibg=#262626
hi           User1                         ctermfg=113               ctermbg=236     cterm=none      guifg=#87d75f   guibg=#303030
hi           User2                         ctermfg=61                ctermbg=236     cterm=none      guifg=#5f5faf   guibg=#303030
hi           User3                         ctermfg=215               ctermbg=236     cterm=none      guifg=#ffaf5f   guibg=#303030
hi           ShowMarksHLm                  ctermfg=56                guifg=#5f00d7
hi           ShowMarksHLl                  ctermfg=44                guifg=#00d7d7
hi           ShowMarksHLo                  ctermfg=34                guifg=#00af00
hi           ShowMarksHLu                  ctermfg=208               guifg=#ff8700


"            Pmenu
hi           Pmenu                         ctermbg=236               ctermfg=7       guifg=#c0c0c0   guibg=#303030
hi           PmenuSel                      ctermbg=15                ctermfg=235     guifg=#262626   guibg=#ffffff
hi           PmenuSbar                     ctermbg=240               guibg=#585858
hi           PmenuThumb                    ctermfg=15                guifg=#ffffff

"            Spell
hi           SpellBad                      ctermbg=52                ctermfg=16      guifg=#000000   guibg=#5f0000
hi           SpellCap                      ctermbg=51                ctermfg=16      guifg=#000000   guibg=#00ffff
hi           SpellLocal                    ctermbg=266               ctermfg=16      guifg=#000000
hi           SpellRare                     ctermbg=94                ctermfg=16      guifg=#000000   guibg=#875f00

"            Diff
hi           DiffDelete                    ctermfg=236               ctermbg=233     guifg=#303030   guibg=#121212
hi           DiffAdd                       ctermbg=235               guibg=#262626
hi           DiffChange                    ctermbg=236               guibg=#303030
hi           DiffText                      ctermbg=0                 cterm=none      guibg=#000000

"            Folds
hi           Folded                        ctermfg=252               ctermbg=232     guifg=#d0d0d0   guibg=#080808
hi           FoldColumn                    ctermfg=61                ctermbg=0       guifg=#5f5faf   guibg=#000000

"            Specials
hi           Title                         ctermfg=215               guifg=#ffaf5f
hi           Todo                          ctermfg=215               guifg=#ffaf5f
hi           SpecialKey                    ctermfg=9                 guifg=#ff0000

"            Tabs
hi           TabLine                       ctermbg=233               ctermfg=102     cterm=none      guifg=#878787   guibg=#121212
hi           TabLineFill                   ctermfg=233               cterm=none      guifg=#121212
hi           TabLineSel                    ctermbg=38                ctermfg=0       cterm=none      guifg=#000000   guibg=#00afd7
hi           TabLineSelMod                 ctermbg=93                ctermfg=0       cterm=none      guifg=#000000   guibg=#8700ff
hi           TabLineMod                    ctermfg=93                ctermbg=233     cterm=none      guifg=#8700ff   guibg=#121212
hi           TabLineBufActiveMod           ctermfg=0                 ctermbg=93      cterm=none      guifg=#000000   guibg=#8700ff
hi           TabLineBufActive              ctermfg=255               ctermbg=26      cterm=none      guifg=#eeeeee   guibg=#005fd7
hi           TabLineBufMod                 ctermbg=38                ctermfg=0       cterm=none      guifg=#000000   guibg=#00afd7

"            Taglist                       colors
hi           TagListTagName                ctermfg=26                cterm=none      guifg=#005fd7
hi           TagListTagScope               ctermfg=113               cterm=none      guifg=#87d75f
hi           TagListTitle                  ctermfg=215               cterm=none      guifg=#ffaf5f
hi           TagListComment                ctermfg=100               cterm=none      guifg=#878700
hi           TagListFileName               ctermfg=255               ctermbg=26      cterm=none      guifg=#eeeeee   guibg=#005fd7
"
"            Matches
hi           MatchParen                    ctermfg=236               ctermbg=215     guifg=#303030   guibg=#ffaf5f

"            Tree
hi           Directory                     ctermfg=15                guifg=#ffffff

"            Syntax
hi           Comment                       ctermfg=241               guifg=#626262
hi           Constant                      ctermfg=113               guifg=#87d75f
hi           Number                        ctermfg=113               guifg=#87d75f
hi           Statement                     ctermfg=74                cterm=none      guifg=#5fafd7
hi           Identifier                    ctermfg=15                guifg=#ffffff
hi           PreProc                       ctermfg=215               guifg=#ffaf5f
hi           Function                      ctermfg=215               guifg=#ffaf5f
hi           Type                          ctermfg=7                 cterm=none      guifg=#c0c0c0
hi           Keyword                       ctermfg=7                 guifg=#c0c0c0
hi           Special                       ctermfg=102               guifg=#878787
hi           Error                         ctermfg=7                 ctermbg=1       guifg=#c0c0c0   guibg=#800000

"            PHP
hi           phpRegionDelimiter            ctermfg=139               guifg=#af87af
hi           phpPropertySelector           ctermfg=102               guifg=#878787
hi           phpPropertySelectorInString   ctermfg=102               guifg=#878787
hi           phpOperator                   ctermfg=102               guifg=#878787
hi           phpArrayPair                  ctermfg=102               guifg=#878787
hi           phpAssignByRef                ctermfg=102               guifg=#878787
hi           phpRelation                   ctermfg=102               guifg=#878787
hi           phpMemberSelector             ctermfg=102               guifg=#878787
hi           phpUnknownSelector            ctermfg=102               guifg=#878787
hi           phpVarSelector                ctermfg=250               guifg=#bcbcbc
hi           phpSemicolon                  ctermfg=102               cterm=none      guifg=#878787
hi           phpFunctions                  ctermfg=252               guifg=#d0d0d0
hi           phpParent                     ctermfg=102               guifg=#878787

"            JavaScript
hi           javaScriptBraces              ctermfg=102               guifg=#878787
hi           javaScriptOperator            ctermfg=102               guifg=#878787

"            HTML
hi           htmlTag                       ctermfg=102               guifg=#878787
hi           htmlEndTag                    ctermfg=102               guifg=#878787
hi           htmlTagName                   ctermfg=250               guifg=#bcbcbc
hi           htmlSpecialTagName            ctermfg=250               guifg=#bcbcbc
hi           htmlArg                       ctermfg=252               guifg=#d0d0d0
hi           htmlTitle                     ctermfg=113               cterm=none      guifg=#87d75f
hi           link                          htmlH1                    htmlTitle
hi           link                          htmlH2                    htmlH1
hi           link                          htmlH3                    htmlH1
hi           link                          htmlH4                    htmlH1
hi           link                          htmlH5                    htmlH1
hi           link                          htmlH6                    htmlH1

"            XML
hi           link                          xmlTag                    htmlTag
hi           link                          xmlEndTag                 htmlEndTag
hi           link                          xmlAttrib                 htmlArg

"            CSS
hi           cssSelectorOp                 ctermfg=7                 guifg=#c0c0c0
hi           link                          cssSelectorOp2            cssSelectorOp
hi           cssUIProp                     ctermfg=252               guifg=#d0d0d0
hi           link                          cssPagingProp             cssUIProp
hi           link                          cssGeneratedContentProp   cssUIProp
hi           link                          cssRenderProp             cssUIProp
hi           link                          cssBoxProp                cssUIProp
hi           link                          cssTextProp               cssUIProp
hi           link                          cssColorProp              cssUIProp
hi           link                          cssFontProp               cssUIProp
hi           cssPseudoClassId              ctermfg=7                 guifg=#c0c0c0
hi           cssBraces                     ctermfg=102               guifg=#878787
hi           cssIdentifier                 ctermfg=215               guifg=#ffaf5f
hi           cssTagName                    ctermfg=215               guifg=#ffaf5f
hi           link                          cssInclude                Function
hi           link                          cssCommonAttr             Constant
hi           link                          cssUIAttr                 Constant
hi           link                          cssTableAttr              Constant
hi           link                          cssPagingAttr             Constant
hi           link                          cssGeneratedContentAttr   Constant
hi           link                          cssAuralAttr              Constant
hi           link                          cssRenderAttr             Constant
hi           link                          cssBoxAttr                Constant
hi           link                          cssTextAttr               Constant
hi           link                          cssColorAttr              Constant
hi           link                          cssFontAttr               Constant
