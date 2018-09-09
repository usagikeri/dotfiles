" Leader-key Setting
let mapleader = "\<Space>"

" Character Settings
" Read Character-code
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
" Write Character-code
set fileencodings=utf-8
" Internal Character-code
set encoding=utf-8

" Display line number
set number
" Tab Settings
set expandtab
set tabstop=4
" Continue indention
set autoindent

" Share Clipboard
set clipboard=unnamed,autoselect

" Highlight the corresponding parentheses
set showmatch

" Search Settings
set incsearch 
set ignorecase 
set smartcase 
set hlsearch 
" Toggle highlighting by pressing the ESC key twice
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" Cursor Settings
set whichwrap=b,s,h,l,<,>,[,],~ 
set cursorline
" Vertical movement
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" Like Emacs 
imap <C-f> <Right>
imap <C-b> <Left>
imap <C-p> <Up>
imap <C-n> <Down>
" Move head in insert-mode
inoremap <C-a> <ESC>I
" Move end in insert-mode
inoremap <C-e> <ESC>A

" File Settings
set autoread
set hidden

" Other
" Activate back space key
set backspace=indent,eol,start
set visualbell t_vb=
" Change ESC
imap <C-j> <Esc>
noremap! <C-j> <Esc>
" Inactive conceal of Json
set conceallevel=0
" No hilight
set cole=0
" Insert a new line
nnoremap <Leader>t :<C-u>call append(expand('.'), '')<Cr>j
" All Copy
nnoremap <Leader>y :%y<Cr>
" Always Display Status-Line
set laststatus=2

" Exe Code
autocmd BufNewFile,BufRead *.sh nnoremap <Leader>a :!sh %
autocmd BufNewFile,BufRead *.py nnoremap <Leader>a :!python %
autocmd BufNewFile,BufRead *.go nnoremap <Leader>a :!go run % 
autocmd BufNewFile,BufRead *.kt nnoremap <Leader>a :!kt % 
autocmd BufNewFile,BufRead *.md nnoremap <Leader>a :PrevimOpen

" Vim-Plug Settings
call plug#begin('~/.vim/plugged') 
Plug 'Shougo/neocomplete.vim'
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Shougo/vimproc.vim' , {'do': 'make'}
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'Yggdroot/indentLine'
Plug 'udalov/kotlin-vim'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'kannokanno/previm', {'for': 'markdown'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',
Plug 'terryma/vim-expand-region'
call plug#end()

"NerdTree-Tabs
map <C-n> <plug>NERDTreeTabsToggle<CR>

" fzf.vim settings
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\}
" Default fzf layout
let g:fzf_layout = { 'down': '~30%' }
" Fzf key-map
nnoremap <silent><Leader>f :FzfFiles<CR>
nnoremap <silent><Leader>b :FzfBuffers<CR>
" nnoremap <silent><Leader>t :FzfTags<CR>

" vim-expand-region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" vim-markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" Previm settings
let g:previm_open_cmd = 'open -a "Google Chrome"'
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/dotfiles/vim/templates/previm/markdown.css'

" syntastic
" let g:syntastic_python_checkers
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" jedi-vim
augroup jedi
    autocmd!
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal omnifunc=jedi#completions
augroup END

" integrate jedi-vim and neocomplete
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

let g:SuperTabContextDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = "<c-n>"

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*' 

" NeoComplete Settings
" ===============================
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1

let g:neocomplete#use_vimproc = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let g:neocomplete#enable_refresh_always = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
\}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" Enable omni completion.
augroup neocomplete
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

let g:neocomplete#sources#omni#input_patterns.go = '\h\w\.\w*'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

" lightline settings ========================
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction
