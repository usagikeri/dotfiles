" Vim Settings
"
" Leader-key Settings
" ====================
let mapleader = "\<Space>"
" ====================

" Character Settings
" ====================
" Read Character-code
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
" Write Character-code
set fileencodings=utf-8
" Internal Character-code
set encoding=utf-8
" Replace : ;
noremap ; :
noremap : ;
" escape
vnoremap u <ESC>
imap <silent> <C-j> <ESC>
" ====================

" Display Settings
" ====================
" Display line number
set number
" Highlight the corresponding parentheses
set showmatch
" Inactive conceal
set conceallevel=0
set concealcursor=
" No hilight
set cole=0
" No visualbell
set visualbell t_vb=
" Always Display Status-Line
set laststatus=2
" Change buffer
set hidden
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

set imdisable

" ====================

" Tab and Indention Settings
" ====================
set expandtab
set tabstop=4
" Continue indention
set autoindent
" ====================

" Clipboard Settings
" ====================
" Share Clipboard
set clipboard=unnamed
" new line paste
nnoremap <silent><Leader>p <silent>o<ESC>p
" ====================

" Search Settings
" ====================
set incsearch
set ignorecase
set smartcase
set hlsearch
" Toggle highlighting by pressing the ESC key twice
nnoremap <silent><Esc><Esc> :nohlsearch<CR>
" ====================

" Move Settings
" ====================
" Cursor Settings
set whichwrap=b,s,h,l,<,>,[,],~
set cursorline
" Vertical movement
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
" Like Emacs
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-p> <Up>
inoremap <C-n> <Down>
" Move head in insert-mode
inoremap <C-a> <ESC>I
" Move end in insert-mode
inoremap <C-e> <ESC>A
"delete char
inoremap <C-h> <BS>
" Activate back space key
set backspace=indent,eol,start
" ====================

" Leader Key Commands
" ====================
" Insert a new line
nnoremap <silent><Leader>j :<C-u>call append(expand('.'), '')<Cr>j
" Insert a new Space
nnoremap <silent><Leader><Space> i<Space><ESC>
" All Copy
nnoremap <silent><Leader>y :<C-u>%y<Cr>
" Horizon split
nnoremap <silent><Leader>hs :<C-u>split<Cr>
" Vertical split
nnoremap <silent><Leader>vs :<C-u>vsplit<Cr>
" Reload vimrc
nnoremap <silent><Leader>rv :<C-u>source ~/.config/nvim/init.vim<Cr>
" Trailing Whitespace
nnoremap <silent><Leader>w :<C-u>FixWhitespace<CR>
" Close Buf
nnoremap <silent><Leader>q :<C-u>q<CR>
nnoremap <silent><Leader>q1 :<C-u>q!<CR>
" No Hilight
nnoremap <silent><Leader>n :<C-u>noh<CR>
" go build and run
autocmd FileType go nnoremap <leader>b  <Plug>(go-build)
autocmd FileType go nnoremap <leader>r  <Plug>(go-run)
" remove doublequotation
noremap <silent><Leader>t :<C-u>RDQ<Cr>
" ====================

" Quick run
" ====================
autocmd bufnewfile,bufread *.sh nnoremap <leader>a :!sh %
autocmd bufnewfile,bufread *.py nnoremap <leader>a :!python %
autocmd bufnewfile,bufread *.go nnoremap <leader>a :!go run %
autocmd bufnewfile,bufread *.kt nnoremap <leader>a :!kt %
autocmd bufnewfile,bufread *.md nnoremap <leader>a :PrevimOpen
autocmd bufnewfile,bufread *.tex nnoremap <leader>a :!texpdf %
" ====================

" Env val
" ====================
let g:python_host_prog=$PYENV_ROOT . '/shims/python2'
let g:python3_host_prog=$PYENV_ROOT . '/shims/python3'
" ====================


" My Function
" ====================
" Remove Double Quotation
command! RDQ call RDQ()
function RDQ()
let line=getline(".")
let repl=substitute(line, '"', "'", "g")
call setline(".", repl)

let line=getline(".")
let repl=substitute(line, '—', "", "g")
call setline(".", repl)

let line=getline(".")
let repl=substitute(line, '', " ", "g")
call setline(".", repl)

let line=getline(".")
let repl=substitute(line, '\.', "\.\r\r", "g")
call setline(".", repl)

call setreg("+", repl)
endfunction
" ====================


" Vim-Plug Settings
" ====================
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'Shougo/vimproc.vim' , {'do': 'make'}
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'nathanaelkane/vim-indent-guides'
" Python
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
" Go
Plug 'fatih/vim-go', {'for': 'go'}
 Plug 'zchee/deoplete-go', {'for': 'go'}
" Markdown
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'kannokanno/previm', {'for': 'markdown'}
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['markdown', 'yaml']}
" File
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mileszs/ack.vim'
" Visual
Plug 'itchyny/lightline.vim'
Plug 'simeji/winresizer'
" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim',
" Buf
Plug 'jlanzarotta/bufexplorer'
Plug 'junegunn/vim-peekaboo'
" Visual-mode
Plug 'terryma/vim-expand-region'
" Tag
Plug 'majutsushi/tagbar'
Plug 'wesleyche/SrcExpl'
Plug 'vim-scripts/taglist.vim'
" Formater
Plug 'dhruvasagar/vim-table-mode'
Plug 'bronson/vim-trailing-whitespace'
" Git
Plug 'tpope/vim-fugitive'
" Other
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'reireias/vim-cheatsheet'
Plug 'mtth/scratch.vim'
call plug#end()
" ====================


" ag settings
" ====================
let g:ackprg = 'ag --nogroup --nocolor --column'
" ====================

" vim-go settings
" ====================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"

" Jedi vim settings
" ====================
let g:jedi#force_py_version = 3
augroup jedi
    autocmd!
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal omnifunc=jedi#completions
augroup END

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_completion_start_length = 1

let g:deoplete#sources#jedi#python_path = "/Users/shinya/.pyenv/shims/python3.7"
let g:deoplete#sources#jedi#server_timeout=100
let g:deoplete#sources#jedi#statement_length=100
let g:jedi#completions_enabled = 0
" =================================

" Vim-Go Settings
" =================================
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
" =================================

"NerdTree-abs
" =================================
map <C-n> <plug>NERDTreeTabsToggle<CR>
let g:NERDTreeShowBookmarks=1
let NERDTreeWinSize=20
" =================================

" fzf.vim settings
" =================================
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
\}
" Default fzf layout
let g:fzf_layout = { 'down': '~30%' }
" fzf key-map
nnoremap <silent><C-f>f :FzfFiles<CR>
nnoremap <silent><C-f>b :FzfBuffers<CR>
nnoremap <silent><C-f>t :FzfTags<CR>
nnoremap <silent><C-f>l :FzfBLines<CR>
nnoremap <silent><C-f>a :FzfBLines<CR>
" =================================

" vim-expand-region settings
" =================================
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink
" =================================

" vim-markdown settings
" =================================
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" =================================

" Previm settings
" =================================
let g:previm_open_cmd = 'open -a "Google Chrome"'
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/.config/nvim/templates/previm/markdown.css'
" =================================

" vim-cheatsheet
" =================================
let g:cheatsheet#cheat_file = '~/.config/nvim/cheatsheet/cheatsheet.md'
" =================================

" syntastic
" =================================
" let g:syntastic_python_checkers
let g:syntastic_python_checkers = ['flake8', 'pep8']
" jedi-vim
let g:jedi#force_py_version = 3
augroup jedi
    autocmd!
    autocmd FileType python setlocal completeopt-=preview
    autocmd FileType python setlocal omnifunc=jedi#completions
augroup END
" =================================

" autopep8 Settings
" =================================
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

autocmd FileType python nnoremap <silent><Leader>ap :call Autopep8()<CR>

" vim-indent-guides
" =================================
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
py3 << END
import vim
import random

oddColor = random.randint(0, 255)
evenColor = random.randint(0, 255)
oddCmd = ":hi IndentGuidesOdd  ctermbg={}"
evenCmd = ":hi IndentGuidesEven ctermbg={}"

vim.command(oddCmd.format(oddColor))
vim.command(evenCmd.format(evenColor))
END

"let g:indent_guides_auto_colors=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=232
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=240
"let g:indent_guides_enable_on_vim_startup=1
"let g:indent_guides_guide_size=1

" lightline settings
" =================================
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
" =================================
