call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/Align'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/SQLUtilities'
Plug 'mileszs/ack.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'wincent/Command-T'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tpope/vim-git'
Plug 'sjl/gundo.vim'
Plug 'reinh/vim-makegreen'
Plug 'vim-scripts/minibufexpl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/The-NERD-tree'
Plug 'alfredodeza/pytest.vim'
Plug 'fs111/pydoc.vim'
Plug 'msanders/snipmate.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/TaskList.vim'
Plug 'sukima/xmledit'
Plug 'vim-scripts/TaskList.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype off
let mapleader = ","

if has("gui_running")
    set guioptions-=T
endif

" Make vim behave in a less vi compatible way
set nocompatible
"behave mswin

set expandtab
set shiftwidth=4 " number of space characters inserted for indentation
set softtabstop=4
set tabstop=4 "number of space characters that will be inserted when the tab key is pressed 
colorscheme torte

set incsearch " incremental search (as you type)
set hlsearch " highlight search

syntax on
filetype on
filetype plugin indent on

set spell

" visual bell
set vb

set number
set relativenumber

" put (~) backup files in /tmp. 
set backupdir=./_backup,/tmp,.

let $PYTHONS='~/.vim/scripts/python.vim'
au FileType python source $PYTHONS
let python_highlight_all=1
let python_slow_sync=1

autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate

" Basic editing from http://sontek.net/turning-vim-into-a-modern-python-ide#id2

" Code folding
" Then you will be able to be inside a method and type 'za' to open and close a fold
set foldmethod=indent
set foldlevel=99

" Window splitting
"Vertical Split : Ctrl+w + v
"Horizontal Split: Ctrl+w + s
"Close current windows: Ctrl+w + q

" Window movement
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-h> <c-w>h

" Snippets
" e.g. def<tab>

" Task list 
map <leader>td <Plug>TaskList

" Revision History 
map <leader>g :GundoToggle<CR>


let g:syntastic_python_checkers = ['flake8']

" change the max line length for PEP8
let g:syntastic_python_flake8_args = "--ignore=E128,E124 --max-line-length=90"

" use eslint for jav
let g:syntastic_javascript_checkers = ['eslint']


" Tab complete and documentation
" Hit <leader>pw when our cursor is on a module to open help in a new window
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

" json highlighting and formatting 
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 

" markdown highlighting for files with extension md.
au BufRead,BufNewFile *.md set filetype=markdown

" preview markdown in chrome - requires a markdown plugin such as
" https://chrome.google.com/webstore/detail/markdown-preview-plus/febilkbfcbhebfnokafefeacimjdckgl
autocmd BufEnter *.md exe 'noremap <leader>p :!open -a "Google Chrome.app" %:p<CR>'

" Buffers
" Open files with :e <filename> to place in a buffer. 
" List buffers with :buffers.
" Switch between the buffers using b<number>, such as :b1 for the first buffer. 
" You can also use its name to match, so you can type :b mod<tab> to autocomplete opening the models.py buffer. 
" To close a buffer you use :bd or :bw.

" Fuzzy Text File Search with command-t
" By default, command-t is bound to <leader>t. 
" Only through opened buffers  using <leader>b.

set wildignore=*.swp,*.bak,*.pyc,*.class,*.jar,*.gif,*.png,*.jpg,*.dcm
set wildignore=*/bower_components/**,*/node_modules/**

" Bind a shortcut key for opening nerd tree
map <leader>n :NERDTreeToggle<CR>

" Refactoring and Go to definition
" bind <leader>j to jump to the definition of the module under the cursor
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching (with Ack)
nmap <leader>a <Esc>:Ack!

" Format (pretty print) json
" https://pascalprecht.github.io/posts/pretty-print-json-in-vim/
map <leader>fj :%!python -m json.tool

" Integration with Git
" Gblame: This allows you to view a line by line comparison of who the last person to touch that line of code is.
" Gwrite: This will stage your file for commit, basically doing git add <filename>
" Gread: This will basically run a git checkout <filename>
" Gcommit: This will just run git commit. Since its in a vim buffer, you can use keyword completion (Ctrl-N), 
" like test_all<Ctrl-N> to find the method name in your buffer and complete it for the commit message. 
" You can also use + and - on the filenames in the message to stage/unstage them for the commit.
" 
set statusline=%{fugitive#statusline()} 

" Test Integration
" 
" django nose
" This will just give you a green bar at the bottom of vim 
" If your test passed or a red bar with the message of the failed test if it doesn't. 
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

" py.test
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

" Virtualenv
"
"" Add the virtualenv's site-packages to vim path

if has('python')

python << EOF
import os.path
import sys
import vim

try:
    settings_module = os.environ['DJANGO_SETTINGS_MODULE']
    if not settings_module: # If it's set but is an empty string.
        raise KeyError
except KeyError:
    import glob
    settings_root = '.'
    try:
        settings_path = glob.glob(os.path.join(settings_root, '*/settings.py'))[0]
    except IndexError:
        pass
    else:
        os.environ['DJANGO_SETTINGS_MODULE'] = '%s.settings' % os.path.basename(os.path.dirname(settings_path))

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    if os.path.isfile(activate_this):
        execfile(activate_this, dict(__file__=activate_this))
EOF
 
endif

" Add 80 characters soft limit.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Mapping for ArgWrap
let g:argwrap_tail_comma = 1
nnoremap <silent> <leader>w :ArgWrap<CR>

" SQLUtil
let g:sqlutil_align_where = 0
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_wrap_expressions = 1

" Colorizer
let g:colorizer_auto_filetype='css,html,json'

let g:dart_style_guide = 2
let g:dart_format_on_save = 1

