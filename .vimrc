syntax on

set clipboard=unnamedplus

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

" Remap default mapleader '\'
let mapleader = "'"

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=100
"highlight ColorColumn ctermbg=0 guibg=lightgrey

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" you should install Vundle plugin before try to install plugins
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Conquer of Completion (required vim >= 8.1.1719 version)
" For installation you need to run:
" cd .vim/bundle/coc.nvim && yarn install
Plugin 'neoclide/coc.nvim', {'branch': 'release'} 

" Debugger Plugins
Plugin 'puremourning/vimspector'
Plugin 'szw/vim-maximizer'

" Language checker
" Have problems finding header files
"Plugin 'vim-syntastic/syntastic'

"Additional syntax highlighting for C++ (including C++11/14/17)
Plugin 'bfrg/vim-cpp-modern'

" File search
Plugin 'kien/ctrlp.vim'

" Silver searcher
Plugin 'rking/ag.vim'

" Clang based comleter
" After installation you need to compile core
" cd ~/.vim/bundle/YouCompleteMe
" python3 install.py --clangd-completer
"Plugin 'ycm-core/YouCompleteMe'

" Another awesome completer
Plugin 'ajh17/VimCompletesMe'

" Motion on speed
Plugin 'easymotion/vim-easymotion'

" Awesome color scheme
Plugin 'morhetz/gruvbox'
Plugin 'phanviet/vim-monokai-pro'

" Status line
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'

" Create tree of files in directory (launch on NERDTreeToggle command)
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Vim based file manager
Plugin 'vifm/vifm.vim', { 'on': 'Vifm' }

" Awesome Git wrapper
Plugin 'tpope/vim-fugitive'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'stsewd/fzf-checkout.vim'

" Your own wiki repository
Plugin 'vimwiki/vimwiki'

" Auto completion for pairs (brackets, quotes and etc.)
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugins Configuration

" Airline config
let g:airline_powerline_fonts = 1

" Gruvbox config
colorscheme gruvbox
set bg=dark    " Setting dark mode

" Path to clangd for YouCompleteMe plugin
let g:ycm_clangd_binary_path = "/usr/bin/clangd"

"NERDTree config
map <C-n> :NERDTreeToggle<CR>
let NERDTreeChDirMode = 2
let NERDTreeShowHidden = 2

" Vifm config
map <Leader>vv :Vifm<CR>

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"EasyMotion config
map <Leader> <Plug>(easymotion-prefix)

"YouCompleteMe config
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

if executable('ag')
    " Use ag over grep "
    set grepprg=ag\ --nogroup\ --nocolor\ --column

    " Use ag in CtrlP for listing files "
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn`t need to cache "
    let g:ctrlp_use_caching = 0
endif

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nnoremap <leader>cr :CocRestart<CR>

" Simple navigation between windows
nnoremap <silent><C-J> <C-W><C-J><CR>
nnoremap <silent><C-K> <C-W><C-K><CR>
nnoremap <silent><C-L> <C-W><C-L><CR>
nnoremap <silent><C-H> <C-W><C-H><CR>

" Remap split screen (vertical && horizontal)
nnoremap <silent> <leader>v <C-W>v

" Disable nabigation keys for studying
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Settings for vimspector (GDB gui debugger)
let g:vimspector_enable_mappings = 'HUMAN'
packadd! vimspector

nmap <F5> <Plug>VimspectorContinue

" Settings for git-fugitive
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <leader>gc :GBranches<CR>

fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Debugger remaps
nnoremap <leader>m :MaximizerToggle!<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" Shows current time
map <F2> :echo 'Current time is ' . strftime('%c')<CR>
