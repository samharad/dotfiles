" To disable a plugin, add it's bundle name to the following list
" YCM and airline are discouraged by #vim... as are Syntastic, gundo, nerdtree...
"let g:pathogen_blacklist = ["YouCompleteMe", "vim-airline", "nerdtree", "syntastic"]
call pathogen#infect()

filetype plugin indent on
" TODO
" Easier window switching
" :Q and :W and :WQ and :Wq should all work
" Make sure the zj, zk, other variants are remapped to zk and zl... or find better alternative
" Display cat on open
autocmd VimEnter * echo ">^.^<"
"set statusline=%f\ %m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]

" Changes spaces to tabs; useful to convert 2-space 'tabs' to tabs, then to 4-space 'tabs'
" Call by selecting all, then :SuperRetab 2, or whatever number of spaces currently used
command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g

" For inserting newlines without going to insert mode
"noremap <leader>O O<Esc>
noremap <CR> o<Esc>
" Basic options ------------------------------------------------------------ {{{
set cinoptions=:0,l1,t0,g0,(0 " Tells vim to align function arguments if on new lines
set hidden " switch buffers without saving
set autochdir " Tells vim to set the current file's dir as the cwd
let mapleader="," " default is \
inoremap <leader>e <C-o>$
syntax on " enable syntax processing
set number " numbers lines
set showmode
set showcmd " show last command in bottom bar (may be disabled by powerline)
set cursorline " draws line on cursor's line
set wildmenu " visual autocomplete for command menu
set lazyredraw " redraw only when needed, speeds up macros
set showmatch " highlights matching bracket/brace/paren
set incsearch " search as characters typed
set hlsearch " highlight matches
set visualbell
set ruler

" Disables automatic commenting when adding newline after comment line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" }}}

" Colors ------------------------------------------------------------------- {{{
colorscheme darkBlue 
" }}}

" Folding ------------------------------------------------------------------ {{{
set foldenable " enable folding
set foldmethod=indent " fold based on indent level
:autocmd FileType vimscript setlocal foldmethod=marker
set foldlevel=0
set modelines=1 "Check last line of file for modeline
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
"space open/closes folds
nnoremap <space> za
" }}}

" Tabs, Spaces, Wrapping, Whitespace --------------------------------------- {{{
set shiftwidth=2 " sets indent to 2, as in auto indent
set tabstop=2 " <tab> displayed as 2 spaces
set softtabstop=2 " <tab> key inserts 2 spaces
set expandtab " <tab> key actually inserts spaces
set smarttab " <Tab> key brings to right place
" }}}

" Buffers ------------------------------------------------------------------ {{{
set nostartofline " When switching back to a buffer, don't move cursor to beginning
" }}}

" Movement, Searching ------------------------------------------------------ {{{
" toggle gundo (vim undo is a tree, and this gives visual traversal)(SUPERundo)
nnoremap <leader>u :GundoToggle<CR>

set pastetoggle=<leader>p " toggles paste mode

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" remap movement to home position
noremap h ;
noremap ; l
noremap l k
noremap k j
noremap j h
" These ensure that long lines aren't skipped if they are visually wrapped
nnoremap k gj
nnoremap l gk
inoremap kl <esc>

inoremap <leader><Tab> <C-o>a
set backspace=indent,eol,start " backspace behave as expected

" removes search highlights
nnoremap <leader><space> :nohlsearch<CR> 

" toggle between number and relativenumber
function! ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
        else
                set relativenumber
        endif
endfunc
" maps ToggleNumber() to <Ctrl-n>
nnoremap <C-n> :call ToggleNumber()<CR>

" After yanking, go to the last character yanked
vmap y y`]

" }}}

" Undo, Redo --------------------------------------------------------------- {{{
" Maps U to REDO 
nnoremap U <c-r>
" }}}

" Spelling, Grammar -------------------------------------------------------- {{{
set spellfile=~/.vim/custom-dictionary.utf-8.add
" For adding words to dictionary
nnoremap <leader>sa zg
" For viewing suggestion menu
nnoremap <leader>ss z=
" au BufRead *.txt setlocal spell! " sets spellcheck on .txt files

" For a grammar plugin... TODO see if is working
" let g:languagetool_jar='~/Applications/LanguageTool-3.5/languagetool-commandline.jar'

" toggles spell check
nnoremap <leader>sc :setlocal spell! spelllang=en_us<CR> 
" }}}

" Macros ------------------------------------------------------------------- {{{
" Select lines in visual mode, then do @<macro reg> to run the macro on all of them
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" }}}

" Filetype-Specific -------------------------------------------------------- {{{
" Make --------------------------------------------------------------------- {{{
autocmd FileType make setlocal noexpandtab " ensures Makefiles use tabs, not spaces
" }}}
" HTML --------------------------------------------------------------------- {{{
" Aurocomplete HTML tags (builtin to vim)
:imap <C-Space> <C-X><C-O>
" }}}
" C/C++ -------------------------------------------------------------------- {{{
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype c setlocal ts=4 sts=4 sw=4 expandtab
" }}}
" }}}

" Plugin settings ---------------------------------------------------------- {{{
" Colorstepper ------------------------------------------------------------- {{{
" ColorStepper Keys
nmap <F7> <Plug>ColorstepPrev
nmap <F9> <Plug>ColorstepNext
nmap <S-F9> <Plug>ColorstepReload
" TODO should have play button make it the default colorscheme
" }}}
" NERDCommenter ------------------------------------------------------------ {{{
let g:NERDCustomDelimiters = { 'html': { 'left': '<!--','right': '-->' } }
" }}}
" Airline ------------------------------------------------------------------ {{{
set laststatus=2
set ttimeoutlen=50
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" }}}
" YouCompleteMe ------------------------------------------------------------ {{{
let g:ycm_autoclose_preview_window_after_completion = 1 " auto close window after completion
let g:ycm_autoclose_preview_window_after_insertion = 1 " auto close window after completion
" }}}
" NerdTree ----------------------------------------------------------------- {{{
:command NT NERDTreeToggle
au vimenter * if !argc() | NERDTree | endif " open nerdtree on empty vim open
" }}}
" Syntastic ---------------------------------------------------------------- {{{
let g:syntastic_enable_signs = 1 " Shows signs in the left column
let g:syntastic_aggregate_errors = 1 " Runs all enabled checkers instead of each in turn (stopping on error found)
let g:ycm_show_diagnostics_ui = 0 " Tells YcM to also use Syntastic checker
"let g:syntastic_debug=3
let g:syntastic_cpp_checkers = ['cppcheck', 'lint381']
let g:syntastic_c_checkers = ['cppcheck', 'lint381']
"set signcolumn=yes
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 5
" }}}
" }}}



" Fold on open
" vim:foldmethod=marker:foldlevel=0
