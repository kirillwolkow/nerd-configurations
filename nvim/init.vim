:set number
:set autoindent
:set tabstop=4
:set smarttab
:set mouse=a

call plug#begin()

" List your plugins here
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'nvim-tree/nvim-web-devicons'

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Start NERDTree and put the cursor 
autocmd VimEnter * NERDTree | wincmd p
" Automatically close tab if it's remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Plugin Notes
" :PlugInstall :PlugClean :PlugUpdate :UpdateRemotePlugins
