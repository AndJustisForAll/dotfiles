"t ********************* VIM PLUG *************************** 
call plug#begin()

" NERDTree file explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" NERDTree git plugin
Plug 'Xuyuanp/nerdtree-git-plugin'
" Syntastic - lint
Plug 'scrooloose/syntastic'
" Deoplete - Dark powered async completion framwork for neovim 
if has('nvim')
    Plug 'shougo/deoplete.nvim', { 'do': 'UpdateRemotePlugins' }
    " Autocomplete flow
    "https://github.com/wokalski/autocomplete-flow
    Plug 'wokalski/autocomplete-flow'
    " For func argument completion
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
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
" CtrlP Smart tabs - tabs feature
Plug 'davidegx/ctrlp-smarttabs'
" Airline - file status and tab line bar
Plug 'bling/vim-airline'
" Neoformat
" !!!Need to install formatters globally. e.g. npm install -g prettier
Plug 'sbdchd/neoformat'
" Fugitive Git wrapper
Plug 'tpope/vim-fugitive'
" Vim Gitgutter - Git gutter line
Plug 'airblade/vim-gitgutter'
" Surround Vim
Plug 'tpope/vim-surround'
" Commentary Vim
Plug 'tpope/vim-commentary'
" Emmet for Vim
Plug 'mattn/emmet-vim'
"Seoul256 Theme
Plug 'junegunn/seoul256.vim'
"Alduin Theme
"https://github.com/rafi/awesome-vim-colorschemes
"https://github.com/AlessandroYorba/Alduin
"Plug 'AlessandroYorba/Alduin', { 'as': 'alduin' }
call plug#end()

" ******************* Plugins initialization
"Seoul256 Theme
color seoul256
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
"
" Emmet for Vim
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_install_global = 0 " only Enable for html/css
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-E>' "Redefine trigger
" Vim -Javascript
let g:javascript_plugin_jsdoc = 1
" Deoplete & neosnippet
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
" CtrlP - Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|bower_components\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
let g:ctrlp_show_hidden = 1
" CtrlP Smart tabs
let g:ctrlp_extensions = ['smarttabs']
" Syntastic - lint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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
nnoremap <leader>qq :q<CR>
nnoremap <leader>ww :w<CR>
nnoremap <leader>wq :wq<CR>
" q is escape in insert mode
inoremap jk <esc>
" toggle NERDTree
nnoremap <leader>1 :NERDTreeToggle<CR>
" toggle CtrlP - fuzzy file search
nnoremap <leader>2 :CtrlPSmartTabs<CR>
" Remap command key
nnoremap <leader>; :
" Switch between VIM viewports
nnoremap <leader><tab> <c-w>w
nnoremap <leader>// :Neoformat<CR>
" Far -search and replace
nnoremap <leader>ff :Farp
nnoremap <leader>fd :Fardo
" Fugitive Vim mappings
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

" Surround Vim
"https://vi.stackexchange.com/questions/12271/how-can-i-change-mapping-for-vim-surround-plugin
nmap <leader>sw ysiw
