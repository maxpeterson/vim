source ~/vim/plugins.vim

let g:coc_global_extensions = [ 'coc-flutter', 'coc-python', 'coc-tsserver', 'coc-eslint', 'coc-json', 'coc-prettier', 'coc-css' ]

filetype off
let mapleader = ","

if has("gui_running")
    set guioptions-=T
endif

" Make vim behave in a less vi compatible way
set nocompatible
"behave mswin

" vim-ctrlspace
set hidden
set encoding=utf-8
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

set expandtab
set shiftwidth=2 " number of space characters inserted for indentation
set softtabstop=2
set tabstop=2 "number of space characters that will be inserted when the tab key is pressed

" Warn before reloading
set noautoread
au FocusGained * :checktime

" Sho spaces as dots `.`
"set list

"source ~/vim/denite.vim
source ~/vim/coc.vim
source ~/vim/NeoSnippet.vim
source ~/vim/airline.vim

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'

" NeoSnippet
let g:neosnippet#enable_snipmate_compatibility=1

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" Vim airline theme
"let g:airline_theme='space'

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
"set winbl=10

"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" === coc.nvim === "
"   <leader>ac    - Remap keys for applying codeAction to the current line.
"   <leader>qf    - Apply AutoFix to problem on the current line."   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nmap <silent> <leader>df <Plug>(coc-float-jump)
nmap <silent> <leader>dh <Plug>(coc-float-hide)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

" FLoat bg / fg colors
highlight CocFloating guibg=DarkMagenta
highlight CocFloating guibg=DarkMagenta

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Claer highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
"   <leader>w - Easy-motion highlights first word letters bi-directionally
map <leader>w <Plug>(easymotion-bd-w)

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

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




" Python

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
"let g:syntastic_javascript_checkers = ['eslint']


" Tab complete and documentation
" Hit <leader>pw when our cursor is on a module to open help in a new window
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

" json highlighting and formatting 
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 

" Jenkinsfile highlighting and formatting
au BufNewFile,BufRead Jenkinsfile setf groovy

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
"set statusline=%{fugitive#statusline()} 

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
let g:argwrap_padded_braces = '{'
nnoremap <silent> <leader>w :ArgWrap<CR>

" SQLUtil
let g:sqlutil_align_where = 0
let g:sqlutil_align_keyword_right = 0
let g:sqlutil_wrap_expressions = 1

" Colorizer
let g:colorizer_auto_filetype='css,html,json'

let g:dart_style_guide = 2
let g:dart_format_on_save = 1


" Show autocomplete when Tab is pressed
"inoremap <silent><expr> <Tab> coc#refresh()


"" Remap keys for applying codeAction to the current line.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)


" ale typescript linting
"let g:ale_fixers = {
"\   'typescript': ['prettier', 'eslint'],
"\}

"let g:ale_linters = {}
"let g:ale_linters.typescript = ['eslint', 'tsserver']

"let g:ale_typescript_prettier_use_local_config = 1

"let g:ale_fix_on_save = 0

"let g:ale_linters_explicit = 1

"au FileType typescript set omnifunc=ale#completion#OmniFunc

" Scroll forwards backwards
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
inoremap <nowait><expr> <C-j> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 1)\<cr>" : "\<Down>"
inoremap <nowait><expr> <C-k> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 1)\<cr>" : "\<Up>"

" tabline

if has('nvim')
    " Always show the tabline
    set showtabline=2
endif

" tab shortcuts
nnoremap <leader>ta <cmd>tabnew<cr>
nnoremap <leader>tc <cmd>tabclose<cr>
nnoremap <leader>to <cmd>tabonly<cr>
nnoremap <leader>tn <cmd>tabn<cr>
nnoremap <leader>tp <cmd>tabp<cr>
nnoremap <leader>tmp <cmd>-tabmove<cr>
nnoremap <leader>tmn <cmd>+tabmove<cr>

let g:taboo_tab_format = ' %N:%P '

" vimspector
"let g:vimspector_enable_mappings = 'HUMAN'
