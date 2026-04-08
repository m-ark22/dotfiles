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
Plug 'maximbaz/lightline-ale'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'ghifarit53/tokyonight-vim'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'rhysd/vim-healthcheck'
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-lsp-ale'
Plug 'alvan/vim-closetag'
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
set autoindent
set smartindent

if has('persistent_undo')
  let target_path = expand('~/.vim/undodir')

  if !isdirectory(target_path)
    call mkdir(target_path, 'p', 0700)
  endif

  let &undodir = target_path
  set undofile
endif

let $ESLINT_D_PPID = getpid()
let g:ale_fix_on_save = 1
let g:ale_set_loclist = 0
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_lint_on_text_changed = 'never'
let g:asyncomplete_auto_popup = 0
let g:tokyonight_style = 'storm'
let g:tokyonight_enable_italic = 1
let g:python_highlight_all = 1
let g:neoformat_try_node_exe = 1
let g:neomake_tsc_exe = 'node_modules/.bin/tsc'
let g:neomake_eslint_exe = 'node_modules/.bin/eslint'
let g:neomake_eslint_cwd = ''
let g:neomake_eslint_args = ['--format=json', '--ext=ts,tsx,js,jsx', '.']
let g:neomake_enabled_makers = ['makeprg', 'eslint']
let g:neomake_typescript_enabled_makers = ['tsc', 'eslint']
let g:neomake_typescriptreact_enabled_makers = g:neomake_typescript_enabled_makers
let g:lsp_settings_filetype_typescript = ['typescript-language-server', 'eslint-language-server']
let g:lsp_settings_filetype_typescriptreact = g:lsp_settings_filetype_typescript
let g:gitgutter_sign_priority = 0
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_filetypes = 'html,xhtml,phtml,php,javascriptreact,typescriptreact'
let g:closetag_enable_react_fragment = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#filter_by_tabpage = 1
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline = {
    \ 'colorscheme': 'tokyonight',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch' ],
    \             [ 'readonly', 'filename', 'modified' ] ],
    \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ],
    \            [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype'] ]
    \ },
    \ 'component': {
    \   'lineinfo': ' %3l:%-2v%<',
    \ },
    \ 'tabline': {
    \   'left': [ [ 'buffers' ] ],
    \   'right': [ [ 'tabs' ] ]
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \   'tabs': 'lightline#tabs',
    \   'linter_checking': 'lightline#ale#checking',
    \   'linter_infos': 'lightline#ale#infos',
    \   'linter_warnings': 'lightline#ale#warnings',
    \   'linter_errors': 'lightline#ale#errors',
    \   'linter_ok': 'lightline#ale#ok',
    \ },
    \ 'component_type': {
    \   'tabs': 'tabsel',
    \   'buffers': 'tabsel',
    \   'linter_checking': 'right',
    \   'linter_infos': 'right',
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \   'linter_ok': 'right',
    \ },
    \ 'component_function': {
    \   'readonly': 'LightlineReadonly',
    \   'gitbranch': 'LightlineFugitive',
    \   'fileformat': 'LightlineFileformat',
    \   'filetype': 'LightlineFiletype',
    \ }
    \ }
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['eslint'],
    \ 'typescriptreact': ['eslint'],
    \ }

let test#javascript#jest#executable = 'node --inspect node_modules/.bin/jest'

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

function! LightlineFileformat()
  return winwidth(0) > 120 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 120 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
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

colorscheme tokyonight

nmap <silent> <Leader>dg <Plug>(doge-generate)

nmap <silent> <leader>t <Cmd>TestNearest<CR>
nmap <silent> <leader>T <Cmd>TestFile<CR>
nmap <silent> <leader>a <Cmd>TestSuite<CR>
nmap <silent> <leader>l <Cmd>TestLast<CR>
nmap <silent> <leader>g <Cmd>TestVisit<CR>
