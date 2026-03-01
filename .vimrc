unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
packadd! matchit

call plug#begin()
Plug 'herringtondarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-python/python-syntax'
Plug 'bfrg/vim-c-cpp-modern'
Plug 'airblade/vim-gitgutter'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'vim-test/vim-test'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'ghifarit53/tokyonight-vim'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
call plug#end()

set autoread
set number
set nowrap
set noswapfile
set expandtab
set tabstop=2      " Optional, if you want files with tabs to look the same too.
set shiftwidth=2
set softtabstop=2  " Use value of shift width
set smarttab       " Always use shift width
set cursorline
set splitbelow
set splitright
set isfname+=@-@
set iskeyword+=-
set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,precedes:«,extends:»,eol:⏎
set noshowmode
set termguicolors
set smartcase
set spelllang=en_us,ru_ru
set laststatus=2
set signcolumn=yes
set updatetime=300
set showtabline=2

if has('persistent_undo')
  let target_path = expand('~/.vim/undodir')

  if !isdirectory(target_path)
    call mkdir(target_path, 'p', 0700)
  endif

  let &undodir = target_path
  set undofile
endif

let g:tokyonight_style = 'storm'
let g:python_highlight_all = 1
let g:tokyonight_enable_italic = 1
let g:neoformat_try_node_exe = 1
let g:neomake_python_enabled_makers = ['ruff', 'ty']
let g:neomake_ruff_maker = {
    \ 'exe': 'ruff',
    \ 'args': ['check', '--output-format', 'concise', '%'],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }
let g:neomake_ty_maker = {
    \ 'exe': 'ty',
    \ 'args': ['check', '--output-format', 'concise', '%'],
    \ 'errorformat': '%f:%l:%c: %m',
    \ }
let g:gitgutter_sign_priority = 0
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filter_by_tabpage = 1
let g:lightline = {
    \ 'colorscheme' : 'tokyonight',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch' ],
    \             [ 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v',
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ] ],
    \   'right': [ [ 'tabs' ] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \   'tabs': 'lightline#tabs'
    \ },
    \ 'component_type': {
    \   'tabs': 'tabsel',
    \   'buffers': 'tabsel',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'gitbranch': 'LightlineFugitive'
    \ }
    \ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*FugitiveHead')
    let branch = FugitiveHead()
    return branch !=# '' ? ' ' . branch : ''
  endif
  return ''
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> <leader>ca <plug>(lsp-code-action)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

augroup fmt
  au!
  autocmd BufWritePre * silent! undojoin | Neoformat
augroup END
call neomake#configure#automake('w')

colorscheme tokyonight

nmap <silent> <Leader>dg <Plug>(doge-generate)

nmap <silent> <leader>t <Cmd>TestNearest<CR>
nmap <silent> <leader>T <Cmd>TestFile<CR>
nmap <silent> <leader>a <Cmd>TestSuite<CR>
nmap <silent> <leader>l <Cmd>TestLast<CR>
nmap <silent> <leader>g <Cmd>TestVisit<CR>
