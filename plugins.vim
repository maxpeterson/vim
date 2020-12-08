call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/Align'
Plug 'chrisbra/Colorizer'
Plug 'vim-scripts/SQLUtilities'
Plug 'mileszs/ack.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'wincent/Command-T'
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sleuth'
Plug 'sjl/gundo.vim'
Plug 'reinh/vim-makegreen'
Plug 'vim-scripts/minibufexpl.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/The-NERD-tree'
Plug 'alfredodeza/pytest.vim'
Plug 'fs111/pydoc.vim'
"Plug 'msanders/snipmate.vim'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'vim-syntastic/syntastic'
Plug 'vim-scripts/TaskList.vim'
Plug 'sukima/xmledit'
Plug 'vim-scripts/TaskList.vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'AndrewRadev/linediff.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
"https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/
" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" auto-close plugin
Plug 'rstacruz/vim-closer'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Denite - Fuzzy finding, buffer management
"Plug 'Shougo/denite.nvim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'

" === Javascript Plugins === "

" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" === UI === "
"
" File explorer
Plug 'scrooloose/nerdtree'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'


"https://medium.com/swlh/ultimate-vim-typescript-setup-35b5ac5c8c4e
"
"Plug 'pangloss/vim-javascript'    " JavaScript support
"Plug 'leafgarland/typescript-vim' " TypeScript syntax
"Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
"Plug 'jparise/vim-graphql'        " GraphQL syntax


call plug#end()
