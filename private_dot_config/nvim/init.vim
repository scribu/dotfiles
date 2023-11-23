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

" Tree-sitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "python", "javascript", "lua", "vim", "vimdoc" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 10 * 1024 * 1024 -- 10 MB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF
