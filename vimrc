filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has("gui_running")
    set guioptions-=T
endif

set expandtab
set shiftwidth=4 " number of space characters inserted for indentation
set softtabstop=4
set tabstop=4 "number of space characters that will be inserted when the tab key is pressed 
colorscheme torte

syntax on
filetype on
filetype plugin indent on

set spell

" visual bell
set vb

" put (~) backup files in /tmp. 
set backupdir=./_backup,/tmp,.


autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


" Basic editing from http://sontek.net/turning-vim-into-a-modern-python-ide#id2

" Code folding
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

" let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0

" pep8
" Use :cn / :cp to go to next / previous error
let g:pep8_map='<leader>8'

" Tab complete and documentation
" Hit <leader>pw when our cursor is on a module to open help in a new window
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

" Buffers
" Open files with :e <filename> to place in a buffer. 
" List buffers with :buffers.
" Switch between the buffers using b<number>, such as :b1 for the first buffer. 
" You can also use its name to match, so you can type :b mod<tab> to autocomplete opening the models.py buffer. 
" To close a buffer you use :bd or :bw.

" Fuzzy Text File Search with command-t
" By default, command-t is bound to <leader>t. 
" Only through opened buffers  using <leader>b.

" Refactoring and Go to definition
" bind <leader>j to jump to the definition of the module under the cursor
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

" Searching (with Ack)
nmap <leader>a <Esc>:Ack!

" Integration with Git
" Add to %{fugitive#statusline()} to statusline

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
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
" 


" json highlighting and formatting 
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax 

" export DJANGO_SETTINGS_MODULE=project.settings
if has('python')
    "setup the python path based on VIRTUAL_ENV (so omnicomplete can find files)
    if filereadable($VIRTUAL_ENV . '/bin/activate_this.py')
        python << EOF
import os

# Try to guess DJANGO_SETTINGS_MODULE if it is not set
try:
    settings_module = os.environ['DJANGO_SETTINGS_MODULE']
    if not settings_module: # If it's set but is an empty string.
        raise KeyError
except KeyError:
    import glob
    try:
        settings_path = glob.glob(os.path.expandvars('$VIRTUAL_ENV/*/settings.py'))[0]
    except KeyError:
        pass
    else:
        os.environ['DJANGO_SETTINGS_MODULE'] = '%s.settings' % os.path.basename(os.path.dirname(settings_path))

activate_this = os.path.expandvars('$VIRTUAL_ENV/bin/activate_this.py')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endif


