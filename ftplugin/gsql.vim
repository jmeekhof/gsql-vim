" GSQL Filetype plugin file
"
" Language:   gsql
" Mantainer:  Josh  Meekhof  <jmeekhof@twotheleft.com>

if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1

setlocal comments=sr:/*,mb:*,ex:*/
setlocal formatoptions=croq
setlocal textwidth=78
