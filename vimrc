" utf-8 only
scriptencoding utf-8

" no vi compat
set nocompatible

" disable bell
set vb t_vb=

" disable backups
set nobackup
set nowritebackup
set noswapfile

" no line wrapping
set nowrap

" sane tab settings
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" enable line numbers
set number
set numberwidth=4

" hide stuffs
set hidden

" use tab complete in menu's
set wildmenu

" kill trailing whitespace when exiting file
autocmd BufWritePre * :%s/\s\+$//e

" Save undo files in sane place, not working dir.
set undodir=$TEMP

" window splitting
set splitbelow
set splitright
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>

" pretty settings for gui versions
if has("gui_running")
  set antialias
  set guifont=PragmataPro:h12
  set guioptions-=T
  set guioptions-=m
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
end

" other keybindings
let mapleader=","

function! InstallVundle ()
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()
  Bundle 'gmarik/vundle'
endfunction

call InstallVundle()
