call plug#begin('~/.config/nvim/plugged')
" Plug 'ervandew/supertab'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'davidhalter/jedi-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'kien/ctrlp.vim'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
" Plug 'tpope/vim-rhubarb' "  for fugitive/Gbrowse
Plug 'tpope/vim-vinegar'
call plug#end()

" Persistent undo
set undofile

" Smaller tabs
set tabstop=4 shiftwidth=4

" Ignore some file types
set wildignore=*~,*.pyc
let g:netrw_list_hide = '\~\*\?$,\.pyc$'

" Neomake
call neomake#configure#automake('w')

" CtrlSF
let g:ctrlsf_default_view_mode = 'compact'

nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

" Python breakpoints
au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>B Oimport pdb; pdb.set_trace()<esc>

" Jedi (Python)
let g:jedi#completions_enabled = 0  " Completions are too slow

" Easily set current directory to current file
map ,cd :lcd %:p:h<CR>:pwd<CR>
