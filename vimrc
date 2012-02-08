scriptencoding utf-8

" {{{ pathogen
    runtime bundle/vim-pathogen/autoload/pathogen.vim
    call pathogen#runtime_append_all_bundles()
    call pathogen#helptags()
" }}}

" {{{ basic settings
    set nobackup
    set nocompatible        " Use Vim defaults (much better!)
    set bs=2                " Allow backspacing over everything in insert mode
    set ai                  " Always set auto-indenting on
    set history=50          " keep 50 lines of command history
    set ruler               " Show the cursor position all the time
    set viminfo='20,\"500   " Keep a .viminfo file.
    " Don't use Ex mode, use Q for formatting
    map Q gq
    " When doing tab completion, give the following files lower priority. You may
    " wish to set 'wildignore' to completely ignore files, and 'wildmenu' to enable
    " enhanced tab completion. These can be done in the user vimrc file.
    set suffixes+=.info,.aux,.log,.dvi,.bbl,.out,.o,.lo
    set modeline
    set modelines=1
" }}}

" {{{ look'n'feel
    syntax enable
"    set bg=dark
    colorscheme darktheme

    " Enable plugin-provided filetype settings, but only if the ftplugin
    " directory exists (which it won't on livecds, for example).
    if isdirectory(expand("$VIMRUNTIME/ftplugin"))
      filetype plugin on
      filetype indent on
    endif

    set showbreak=>>>
    set wrap
    set lbr
    set nolist
    " set tw=80
    set hidden
    set mouse=a
    set scrolloff=5
    set listchars=tab:▸\ ,eol:¬
    set grepprg="grep -nH $*"
    set laststatus=2
    set hlsearch ignorecase smartcase is
    set statusline=[%n/%{tabpagenr('$')}][%1*%<%{getcwd()}%*\]\[%{fugitive#statusline()}\]\[%3*%<%f%*\]\[%1*%<%M%R%H%W%*\]\ %=\ \[%3*%{DispLang()}%*\][\%1*%{DispPaste()}%*\][%3*%03b,0x%B%*\ %1*%03l/%03L,%03c%*\ %2*%P%*]
"    set cursorline
"    set cursorcolumn

    " numbers
    set number
    set numberwidth=3
    " enocding
    set termencoding=utf-8 fileencoding=utf-8 encoding=utf-8
    set ts=4 sw=4 sts=4 et
    
" }}}

" {{{ folding
    set fdm=syntax
    set foldcolumn=6
    set foldtext=FoldText()
    set foldlevel=1

    function! FoldText()
        let l = substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
        let l = substitute(l, '^[ ]\+','','g')
        let dif = v:foldend - v:foldstart + 1
        let a = "+> " . v:foldend . "(" . dif . " lines)[lv: " . v:foldlevel . "]: " . l
        return a
    endfunction " }}}
" }}}

" {{{ Terminal fixes
    if &term ==? "xterm"
      set t_Sb=^[4%dm
      set t_Sf=^[3%dm
      set ttymouse=xterm2
    endif

    if &term ==? "gnome" && has("eval")
      " Set useful keys that vim doesn't discover via termcap but are in the
      " builtin xterm termcap. See bug #122562. We use exec to avoid having to
      " include raw escapes in the file.
      exec "set <C-Left>=\eO5D"
      exec "set <C-Right>=\eO5C"
    endif

    " Fix &shell, see bug #101665.
    if "" == &shell
      if executable("/bin/zsh")
        set shell=/bin/zsh
      elseif executable("/bin/sh")
        set shell=/bin/sh
      endif
    endif

    " Our default /bin/sh is bash, not ksh, so syntax highlighting for .sh
    " files should default to bash. See :help sh-syntax and bug #101819.
    if has("eval")
      let is_bash=1
    endif
" }}}

" {{{ vimrc.local
    if filereadable("/etc/vim/vimrc.local")
      source /etc/vim/vimrc.local
    endif
" }}}

" {{{ spelling
    set spelllang=pl

    function! SpellLangToggle()
        if(&spelllang == 'pl')
            set spelllang=en
        else
            set spelllang=pl
        endif
    endfunction

    function! DispPaste()
        if(&paste)
            return 'paste'
        else
            return ''
        endif
    endfunction

    function! DispLang()
        if(&spell)
            return &spelllang
        else
            return 'nospell'
        endif
    endfunction
" }}}

" {{{ tabline
    set tabpagemax=30
    set showtabline=2
    set tabline=%!MyTabLine()

    function! MyTabLine()
        let s = ''
        for i in range(1, tabpagenr('$'))
            let s .= '%#TabLine#'
            let s .= '%' . (i) . 'T'
            let winnr = tabpagewinnr(i)
            if i == tabpagenr()
                let t = '%#TabLineSel#' . i . ' '
                for j in tabpagebuflist(i)
                    if j == winbufnr(winnr)
                        if getbufvar(j,'&modified')
                            let t .= '%#TabLineBufActiveMod#+'
                        else
                            let t .= '%#TabLineBufActive#'
                        endif
                    else
                        if getbufvar(j,'&modified')
                            let t .= '%#TablineBufMod#+'
                        endif                        
                    endif
                    let t .= fnamemodify(bufname(j), ':t')
                    let t .= '%#TabLineSel# '
                endfor
            else
                let m = 0
                for j in tabpagebuflist(i)
                    if getbufvar(j,'&modified')
                        let m = 1
                    endif
                    let n = fnamemodify(bufname(j), ':t')
                endfor
                if m == 1
                    let t = '%#TabLineMod#'
                else
                    let t = '%#TabLine#'
                endif
                let t .= i . ' ' . n . ' '
                let t .= '%#TabLine# '
            endif
            let s .= t
        endfor
        let s .= '%#TabLineFill#%T'
        if tabpagenr('$') > 1
            let s .= '%=%#TabLine#%999XX'
        endif
        return s
    endfunction
" }}}

" {{{ other
    " Show syntax highlighting groups for word under cursor
    nmap <C-S-P> :call <SID>SynStack()<CR>
    function! <SID>SynStack() " {{{ SynStack
      if !exists("*synstack")
        return
      endif
      echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
    endfunc " }}}
" }}}
" {{{ Mappings
    " {{{ tabs
    nnoremap <Leader>T   :tabnew<CR>
    map      <A-Left>    :tabprev<CR>
    map      <A-Right>   :tabnext<CR>
    " }}}
    " {{{ toggles
    nnoremap <Leader>tn  :set number!<CR>
    nnoremap <Leader>tl  :set list!<CR>
    nnoremap <Leader>tp  :set paste!<CR>
    nnoremap <Leader>ts  :set spell!<CR>
    nnoremap <Leader>tw  :set wrap!<CR>
    nnoremap <Leader>tS  :call SpellLangToggle()<CR>
    nnoremap <Leader>co  :copen<CR>
    nnoremap <Leader>cc  :cclose<CR>
    nnoremap <Leader>tag :TlistToggle<CR>
    " }}}
    " {{{ quit'n'save
    nnoremap <Leader>qw  :w<CR>
    nnoremap <Leader>qW  :wa<CR>
    nnoremap <Leader>qq  :q!<CR>
    nnoremap <Leader>qa  :qa<CR>
    nnoremap <Leader>qx  :x<CR>
    " }}}
    " {{{ buffers
    nnoremap <Leader>bn  :bn<CR>
    nnoremap <Leader>bp  :bp<CR>
    nnoremap <Leader>bd  :bd<CR>
    " }}}
    " {{{ fugitive
    nnoremap <Leader>gc  :Gcommit -a<CR>
    nnoremap <Leader>gs  :Gstatus<CR>
    nnoremap <Leader>gd  :Gdiff<CR>
    " }}}
    " {{{ moving
    map      <C-Left>    :wincmd h<CR>
    map      <C-Down>    :wincmd j<CR>
    map      <C-Up>      :wincmd k<CR>
    map      <C-Right>   :wincmd l<CR>
    vmap     <A-Down>    gj
    vmap     <A-Up>      gk
    vmap     <A-4>       g$
    vmap     <A-6>       g^
    vmap     <A-0>       g^
    nmap     <A-Down>    gj
    nmap     <A-Up>      gk
    nmap     <A-4>       g$
    nmap     <A-6>       g^
    nmap     <A-0>       g^
    " }}}
    " {{{ other
    map      <C-e>       :reg<CR>
    map      'marks      :marks<CR>
    nnoremap <C-d>       :A<CR>
    inoremap <C-d>       :A<CR>
    nmap     <Leader>di  :DiffChangesDiffToggle<CR>
    nmap     <Leader>dp  :DiffChangesPatchToggle<CR>
    vmap     <Tab>       :Tab /=<CR>
     "}}}
" }}}
"

" vim:foldmethod=marker foldlevel=0
