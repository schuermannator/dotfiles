syntax on

set laststatus=2
set number
set expandtab
set tabstop=4
set shiftwidth=4
color dracula
"colorscheme base16-gruvbox-dark-medium

set autoindent
set nocindent

set mouse=a

set guifont=Monospace\ 12

if has('nvim')
    "set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set guicursor=
    set inccommand=nosplit
end

" If installed using Homebrew
" need to make this more portable
set rtp+=/usr/local/opt/fzf
set rtp+=/usr/bin/fzf


" Enable filetype plugins
filetype plugin on
filetype plugin indent on

" (unused) Set to auto read when a file is changed from the outside
" set autoread                 

let mapleader ="\<Space>"      
let g:maplxeader ="\<Space>"    


""" old/unused
" set guioptions-=T  " remove menu bar
" colorscheme peachpuff
" keybindings
"noremap \f :FSHere<CR>
"noremap \t :tabnew<CR>
"noremap \v :vs<CR>
"noremap \s :sp<CR>
"noremap \a :tabprevious<CR>
"noremap \d :tabnext<CR>
"noremap \q :q<CR>
"noremap \Q :bd<CR>
"noremap \m :set mouse=a<CR>
"noremap \M :set mouse=<CR>
"noremap \c :e %<.c<CR>
"noremap \C :e %<.cpp<CR>
"noremap \h :e %<.h<CR>
"
" Sets how many lines of history VIM has to remember
set history=1000

" deal with colors
if !has('gui_running')
  set t_Co=256
endif

" used to have this added below: (annoying with tmux so removed)
" && (match($TERM, "screen-256color") == -1)
if (match($TERM, "-256color") != -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Permanent undo
set undodir=~/.vimdid
set undofile

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

nnoremap <C-g> <Esc>
inoremap <C-g> <Esc>
vnoremap <C-g> <Esc>
snoremap <C-g> <Esc>
xnoremap <C-g> <Esc>
cnoremap <C-g> <Esc>
onoremap <C-g> <Esc>
lnoremap <C-g> <Esc>
tnoremap <C-g> <Esc>

map <C-h> ^
map <C-l> $

" Completion
set cmdheight=2
set updatetime=300
" Use `C-j` and `C-k` to navigate diagnostics
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use <leader> d to trigger gotodef
nmap <silent> <leader>d <Plug>(coc-definition)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

let g:fzf_layout = { 'down': '~30%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Golang
let g:go_bin_path = expand("~/dev/go/bin")


" <leader>s for Rg search
nnoremap <leader>s :Rg<CR>
" nnoremap <leader>f :Rg! 

" Open new file adjacent to current file
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Airline
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename 

" -----------Buffer Management---------------
set hidden " Allow buffers to be hidden if you've modified a buffer

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>q :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

nnoremap <leader>. :GFiles<CR>
nnoremap <leader>, :Buffers<CR>

" No arrow keys 
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Use arrow keys to navigate window splits
"nnoremap <silent> <Right> :wincmd l <CR> 
"nnoremap <silent> <Left> :wincmd h <CR>
"noremap <silent> <Up> :wincmd k <CR>
"noremap <silent> <Down> :wincmd j <CR>
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

nnoremap <leader><leader> <c-^>
nnoremap <leader>b g<c-g>

" don't need F1 help. F1 --> esc
map <F1> <Esc>
imap <F1> <Esc>

" ctrl-p
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git|.svn|.hg|.bzr directory as the cwd
let g:ctrlp_working_path_mode = 'r' 
" enter file search mode
nmap <leader>p :CtrlP<cr>

" Nerdtree
" autocmd vimenter * NERDTree"
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open and close file tree
map <C-n> :NERDTreeToggle<CR>
" open current buffer in file tree
nmap <leader>n :NERDTreeFind<CR>

