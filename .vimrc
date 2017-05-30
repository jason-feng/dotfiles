" ----------------------------------------------------------------------------
"   .vimrc                                                                {{{
" ----------------------------------------------------------------------------

" Allow vim to break compatibility with vi
set nocompatible " This must be first, because it changes other option

" }}}-------------------------------------------------------------------------
"   24-bit Color                                                           {{{
" ----------------------------------------------------------------------------
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" }}}-------------------------------------------------------------------------
"   Pathogen                                                              {{{
" ----------------------------------------------------------------------------

execute pathogen#infect()
syntax on
filetype plugin indent on

let python_highlight_all = 1

" }}}-------------------------------------------------------------------------
"   Visual                                                                {{{
" ----------------------------------------------------------------------------

filetype plugin indent on

set showcmd                 " Show (partial) command in the last line of the screen.
set laststatus=2            " The last window will have a status line always
set visualbell              " Use a visual bell, don't beep!
set number                  " Show line numbers
set list                    " Make whitespace characters visible
set listchars=trail:•       " Show trailing spaces
:set hlsearch               " Highlight all search matches
:set cursorline             " Highlight current selected line


" }}}-------------------------------------------------------------------------
"   Colors                                                                {{{
" ----------------------------------------------------------------------------
syntax enable
colorscheme onedark

" }}}-------------------------------------------------------------------------
"   Mouse                                                                 {{{
" ----------------------------------------------------------------------------

set mouse+=a  " Add mouse support for 'all' modes, may require iTerm to scroll
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" }}}-------------------------------------------------------------------------
"   Search                                                                {{{
" ----------------------------------------------------------------------------

set incsearch               " Jump to search results as we type

" }}}-------------------------------------------------------------------------
"   Tabs                                                                  {{{
" ----------------------------------------------------------------------------

" Feel free to change these to fit your preference
set tabstop=2               " Show a tab as four spaces
set shiftwidth=2            " Reindent is also four spaces
set softtabstop=2           " When hit <tab> use four columns
set expandtab               " Create spaces when I type <tab>

set shiftround              " Round indent to multiple of 'shiftwidth'.
filetype plugin indent on   " Rely on file plugins to handle indenting

" }}}-------------------------------------------------------------------------
"   Custom commands                                                       {{{
" ----------------------------------------------------------------------------

" Handy mappings to e[dit] or s[ource] your .vimrc
nmap <silent> <Leader>ev :vsplit $MYVIMRC<CR>
nmap <silent> <Leader>sv :source $MYVIMRC<CR>

" }}}-------------------------------------------------------------------------
"   Configure My Plugins                                                  {{{
" ----------------------------------------------------------------------------

" Syntastic
" Don't user pylint even though it's installed
let g:syntastic_python_checkers = ['python', 'pyflakes', 'pep8']
let g:syntastic_python_pep8_args="--ignore=E501,E121,E125,E126,E128,C0111"

" Ctrl-P
let g:ctrlp_working_path_mode = 'rw' " Search within the current Git project
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
    \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
    \ 'link': '',
    \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1

" If we have The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

" }}}-------------------------------------------------------------------------
"   Custom mappings                                                       {{{
" ----------------------------------------------------------------------------

" Do what my fat fingers mean!
command! Bd bd
command! BD bd
command! Q q
command! W w

" Nobody ever uses "Ex" mode, and it's annoying to leave
noremap Q <nop>
