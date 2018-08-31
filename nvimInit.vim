set nocompatible               " be improved, required
filetype off                   " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim

" set Somethin
set ruler
set relativenumber
" Vundle Begin
call vundle#begin('~/.config/nvim/plugged')

Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'svermeulen/vim-easyclip'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'flazz/vim-colorschemes'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'vim-syntastic/syntastic'
" Track the engine.
Plugin 'SirVer/ultisnips'
Plugin 'wesQ3/vim-windowswap'
Plugin 'Yggdroot/indentLine'
Plugin 'digitaltoad/vim-pug'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
" from mas rud
"Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'myusuf3/numbers.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'prettier/vim-prettier', {
            \ 'do': 'yarn install',
            \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'javascript.jsx'] }
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'othree/html5.vim'
Plugin 'xolox/vim-misc'
Plugin 'ludovicchabant/vim-gutentags'

call vundle#end()

filetype plugin indent on

set ttyfast
set autoread
set autoindent
set backspace=indent,eol,start
set laststatus=2
"set hlsearch
set noerrorbells
set number
set splitright
set splitbelow
set fileformats=unix,dos,mac
set noshowmatch
set noshowmode
set nocursorcolumn
"set cursorline
set lazyredraw

set noet nowrap tw=0 ww=0
set tabstop=4 softtabstop=2 expandtab shiftwidth=2 smarttab

set nobackup
set pastetoggle=<F5>
set scrolloff=5


" Put plugins and dictionaries in this dir (also on Windows)
let vimDir = '$HOME/.config/nvim'
let &runtimepath.=','.vimDir

"---------NERD-TREE SETTINGS----------
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_console_startup = 1
map <C-n> :NERDTreeToggle<CR>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')

    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Vim status line settings
let g:airline_powerline_fonts = 1
let g:airline_theme = 'murmur'
" Populate proper symbol font
let g:airline_powerline_fonts = 1
" Configure symbol
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

" Ctrlp-funky highlight syntax
let g:ctrlp_funky_syntax_highlight = 1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Use Ag over Grep.
set grepprg=ag\ --nogroup\ --nocolor
"let g:ctrlp_user_command = 'ag %s -l --nocolor'
let g:ctrlp_user_command = {
            \ 'types': {
            \ 1: ['.git', 'cd %s && git ls-files'],
            \ 2: ['.hg', 'hg --cwd %s locate -I .'],
            \ },
            \ 'fallback': 'ag %s -l --nocolor --nogroup --hidden
            \ --ignore out
            \ --ignore .git
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"
            \ -g ""'
            \ }

let g:ctrlp_match_window = 'max:20,results=100'

let mapleader = ','

" Show invisible characters.
set listchars=eol:¬,tab:»\ ,trail:·,extends:›,precedes:‹,nbsp:·
set list

" Map Keys.
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

nnoremap nt  :NERDTreeToggle<CR>

nnoremap <F4> :set hlsearch!<CR>

nnoremap <Leader>yy :set clipboard=unnamedplus<CR>
nnoremap <Leader>yc :set clipboard=<CR>

" GoLang settings.
autocmd FileType go nmap <Leader>gdc <Plug>(go-doc)
autocmd FileType go nmap <Leader>goi <Plug>(go-info)

autocmd FileType go nnoremap <Leader>god :GoDecls<CR>
autocmd FileType go nnoremap <Leader>gor :GoDeclsDir<CR>
autocmd FileType go nnoremap <Leader>gsi :GoSameIds<CR>
autocmd FileType go nnoremap <Leader>gsc :GoSameIdsClear<CR>

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1

let g:go_auto_type_info = 1

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 0
let g:go_def_mode = "godef"

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

let g:javascript_plugin_jsdoc = 1

" Let <Tab> also do completion
inoremap <silent><expr> <Tab>
\ pumvisible() ? "\<C-n>" :
\ deoplete#mappings#manual_complete()

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
