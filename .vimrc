" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure to use single quotes for plugins

" Ctrl P file search
Plug 'kien/ctrlp.vim'

" Emmet Vim
Plug 'mattn/emmet-vim'

" Gruvbox theme
Plug 'morhetz/gruvbox'

" Lexima auto close brakets and such
Plug 'cohama/lexima.vim'

" Nerdtree
Plug 'scrooloose/nerdtree'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
	\ 'do': 'yarn install',
	\ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] }

" Syntastic
Plug 'vim-syntastic/syntastic'

" Prefer EsLint over Syntastic globals
Plug 'mtscout6/syntastic-local-eslint.vim'

" Airline
Plug 'vim-airline/vim-airline'

" airline themes
Plug 'vim-airline/vim-airline-themes'

" Sensible
Plug 'tpope/vim-sensible'

" Vim Surround
Plug 'tpope/vim-surround'

" Javascript syntax
Plug 'pangloss/vim-javascript'

" JSX
Plug 'mxw/vim-jsx'

" Initialize plugin system
call plug#end()

filetype plugin indent on
syntax on

" Color Scheme
syntax enable
set background=dark
colorscheme gruvbox 

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Set Font
set guifont=Fira\ Code:h12

" Always show line numbers
set relativenumber
set number

" Map nt to NerdTree command
:command NT NERDTree

" Prettier Settings
" max line lengh that prettier will wrap on
let g:prettier#config#print_width = 80

" number of spaces per indentation level
let g:prettier#config#tab_width = 2

" use tabs over spaces
let g:prettier#config#use_tabs = 'false'

" print semicolons
let g:prettier#config#semi = 'true'

" single quotes over double quotes
let g:prettier#config#single_quote = 'true' 

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true' 

" put > on the last line instead of new line
let g:prettier#config#jsx_bracket_same_line = 'true' 

" Tabs to spaces and also make sure all indents are two spaces
set expandtab
set tabstop=2
set shiftwidth=2
filetype plugin indent on

" Setup Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

" For Airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
set laststatus=2

" Show hidden files by default in NerdTree
let g:NERDTreeShowHidden=1

if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to 
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
