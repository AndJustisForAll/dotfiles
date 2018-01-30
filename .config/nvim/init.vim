" ********************* VIM PLUG *************************** 
call plug#begin()

" NERDTree file explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" NERDTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Neomake - Async :make & linting framwork
Plug 'benekastah/neomake'
" Deoplete - Dark powered async completion framwork for neovim 
if has('nvim')
    Plug 'shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
" Far vim - search and replace across files
Plug 'brooth/far.vim'
" Vim-Javascript
Plug 'pangloss/vim-javascript'
" CtrlP - commandline fuzzy finder
Plug 'kien/ctrlp.vim'
" Airline - file status and tab line bar
Plug 'bling/vim-airline'
" JS beautifier
Plug 'maksimr/vim-jsbeautify'
" Fugitive Git wrapper
Plug 'tpope/vim-fugitive'
" Vim Gitgutter - Git gutter line
Plug 'airblade/vim-gitgutter'
" Emmet for Vim
Plug 'mattn/emmet-vim'
" Vim JSX
Plug 'mxw/vim-jsx'
"Seoul256 Theme
Plug 'junegunn/seoul256.vim'
"Alduin Theme
"https://github.com/rafi/awesome-vim-colorschemes
"https://github.com/AlessandroYorba/Alduin
Plug 'AlessandroYorba/Alduin', { 'as': 'alduin' }
call plug#end()


" ******************* Plugins initialization
"Seoul256 Theme
colo seoul256
set background=dark
set termguicolors

" Alduin Theme
" colorscheme alduin
" Almost black
" let g:alduin_Shout_Dragon_Aspect = 1
" Black
"let g:alduin_Shout_Become_Ethereal = 1
" Dark red special
" let g:alduin_Shout_Fire_Breath = 1

"JSX for vim
let g:jsx_ext_required = 0 "JSX within .js files
" Emmet for Vim
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_install_global = 0 " only Enable for html/css
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-E>' "Redefine trigger
" Vim -Javascript
let g:javascript_plugin_jsdoc = 1
" Deoplete
let g:deoplete#enable_at_startup = 1
" CtrlP - Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
" Vim Gitgutter
let g:gitgutter_max_signs = 500  " default value
" *********************** DEFAULT ************************** "
syntax on
" enables filetype detection,
" enables filetype-specific scripts (ftplugins),
" enables filetype-specific indent scripts.
filetype plugin indent on

" Makes the cursor a pipe in insert mode and block in normal mode
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ****************** SPACES & TABS ************************** "
"For indents that consist of 4 space characters but are entered with the tab key:
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" ******************* UI CONFIG ****************************** "
set number " show line numbers
set cursorline " highlight current line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]

" ******************* Searching *******************************"
set incsearch " search as characters are entered 
set hlsearch " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set ic " Ignore case

" ********************* FOLDING **********************************"
set foldenable " enable folding
set foldlevelstart=10  " open most folds by default
set foldnestmax=10 "10 nested folds max
set foldmethod=indent " fold based on indent level
" space open/closes folds in normal mode
nnoremap <space> za

" ******************** MOVEMENT ************************************"
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to the end of the line
nnoremap 0 $
nnoremap 9 ^
" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>
" highlight last inserted text
nnoremap gV '[v']

" *********************** LEADER SHORTCUTS **************************"
let mapleader=","        " leader is comma
" q is escape in insert mode
inoremap hh <esc>
" toggle NERDTree
nnoremap <leader>1 :NERDTreeToggle<CR>
" toggle CtrlP - fuzzy search
nnoremap <leader>2 :CtrlP<CR>
" Remap command key
nnoremap <leader>; :
" Switch between VIM viewports
nnoremap <leader><tab> <c-w>w
" Format JS code
nnoremap <leader>// :call JsBeautify()<CR>
" Far -search and replace
nnoremap <leader>ff :Farp
nnoremap <leader>fd :Fardo
" Fugitive Vim mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>


