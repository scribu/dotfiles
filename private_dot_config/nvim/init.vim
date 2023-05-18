" Disable Python2
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
" Plug 'ervandew/supertab'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tpope/vim-rhubarb' "  for fugitive/Gbrowse
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'davidhalter/jedi-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'hynek/vim-python-pep8-indent'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neomake/neomake'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
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

let g:ctrlsf_backend = 'rg'

" Easily set current directory to current file
map ,cd :lcd %:p:h<CR>:pwd<CR>

" Typescript
au FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab
