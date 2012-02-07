" Filename:    formfiller.vim
" Purpose:     Vim syntax file
" Language:    UZBL form
" Maintainer:  Paweł Zuzelski <pawelz@pld-linux.org>
"              Paul Tomak (grodzik) <pawel.tomak@gmail.com>
" URL:         http://gist.github.com/347641
" Last Change: 2010/03/29
" Version:     1

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
" if version < 600
"   syntax clear
" elseif exists("b:current_syntax")
"   finish
" endif

syn keyword formfillerTodo contained TODO FIXME XXX
syn keyword formfillerType contained search radio checkbox text textarea password

syn match   formfillerValue display contained ':.*'
syn match   formfillerState display contained '{[^}]*}'
syn match   formfillerFieldType display contained '([^)]\+)' contains=formfillerType
syn match   formfillerComment "^>.*" display contains=formfillerTodo
syn match   formfillerFormElement "^[^>].*:.*$" display contains=formfillerState,formfillerValue,formfillerFieldType

syn match   formfillerProfileNeedRename display contained 'NAME_THIS_PROFILE_\d\+'
syn match   formfillerAutosubmit display contained 'autosubmit=\d'
syn match   formfillerProfileName display contained '=.\+' contains=formfillerProfileNeedRename
syn region   formfillerProfile display start='^!profile=' end='$' contains=formfillerProfileName
syn region   formfillerForm display start='^!form\[.\+\]:' end='$' contains=formfillerAutosubmit

if version >= 508 || !exists("did_formfiller_syn_inits")
    if version <= 508
        let did_formfiller_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    " Define the default highlighting.
    " Only used when an item doesn't have highlighting yet
    HiLink formfillerComment        Comment
    HiLink formfillerTodo           Todo
    HiLink formfillerFormElement    NONE
    HiLink formfillerType           Comment
    HiLink formfillerFieldType      Special
    HiLink formfillerState          Statement
    HiLink formfillerValue          Number
    HiLink formfillerProfile        Comment
    HiLink formfillerProfileName    Statement
    HiLink formfillerProfileNeedRename Error
    HiLink formfillerForm           Comment
    HiLink formfillerAutosubmit     Statement

    delcommand HiLink
endif

let b:current_syntax = "formfiller"
