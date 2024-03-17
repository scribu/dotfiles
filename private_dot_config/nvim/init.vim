" Disable Python2
let g:loaded_python_provider = 0
let g:python3_host_prog = '/usr/bin/python3'

call plug#begin('~/.config/nvim/plugged')
" Plug 'ervandew/supertab'
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'tpope/vim-rhubarb' "  for fugitive/Gbrowse
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'davidhalter/jedi-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim', {'branch': 'release'}
Plug 'hynek/vim-python-pep8-indent'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neomake/neomake'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'shaunsingh/solarized.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
call plug#end()

" Theme
let g:solarized_borders = v:true
let g:solarized_contrast = v:true
colorscheme solarized

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
}
EOF

" Persistent undo
set undofile

" Ignore some file types
set wildignore=*~,*.pyc
let g:netrw_list_hide = '\~\*\?$,\.pyc$'

" Neomake
let g:neomake_precommit_maker = {
    \ 'exe': 'pre-commit',
	\ 'args': ['run', '--files'],
    \ }

let g:neomake_python_enabled_makers = ['precommit', 'flake8']

call neomake#configure#automake('w')

" CtrlP - ignore files in .gitingore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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
au FileType python map <silent> <leader>b obreakpoint()<esc>
au FileType python map <silent> <leader>B Obreakpoint()<esc>

" Jedi (Python)
let g:jedi#completions_enabled = 0  " Completions are too slow

let g:ctrlsf_backend = 'rg'

" Easily set current directory to current file
map ,cd :lcd %:p:h<CR>:pwd<CR>
