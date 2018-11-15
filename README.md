# GSQL Syntax highlighting #
GSQL is what [Tigergraph](http://www.tigergraph.com/) uses as it's graph query language.

I've based this off [sql.vim](https://www.vim.org/scripts/script.php?script_id=3702).

# Install
Use your favorite plugin manager.

I use [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'jmeekhof/gsql-vim'
```

# Quick Use of a plugin manager
This is the quickest way I've found to use a plugin manager, such as vim-plug.

Adding the following snippet to your `~/.vimrc` should do the trick:
```vim
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'jmeekhof/gsql-vim'

call plug#end()
```
