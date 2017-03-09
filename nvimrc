"%s/\(xxxx\)/(\1)/gci
" fist number
":let i=0|g/^/s//\=i.','/ |let i+=1
":%s/^/\=line('.').','/


" Vundle
set nocompatible " not compatible with the old-fashion vi mode
filetype off " required!

" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.nvim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.nvim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.nvim/bundle/vundle
  let iCanHazVundle=0
endif

set termguicolors
set rtp+=~/.nvim/bundle/vundle
call vundle#rc("~/.nvim/bundle")

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'MephistoMMM/molokai'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'airblade/vim-gitgutter'
"Bundle 'Townk/vim-autoclose'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'vim-scripts/CRefVim'
Bundle 'pangloss/vim-javascript'
Bundle 'ryanss/vim-hackernews'
Bundle 'kdurant/LanguageRefVim'
Bundle 'tpope/vim-surround'
Bundle 'rking/ag.vim'
Bundle 'justinmk/vim-syntax-extra'

"Note
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-notes'

"paste
Bundle 'ConradIrwin/vim-bracketed-paste'

Bundle 'kshenoy/vim-signature'
Bundle 'Yggdroot/indentLine'
Bundle 'vim-scripts/MultipleSearch'
Bundle 'terryma/vim-multiple-cursors'

"snip
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

"yank
Bundle 'tpope/vim-repeat'
Bundle 'svermeulen/vim-easyclip'

vnoremap d X


"MultieSearch
let g:MultipleSearchMaxColors=13
let g:MultipleSearchColorSequence="red,yellow,blue,green,magenta,lightred,cyan,lightyellow,gray,brown,lightblue,darkmagenta,darkcyan"
let g:MultipleSearchTextColorSequence="white,black,white,black,white,black,black,black,black,white,black,white,white"

"ag setting
let g:ag_prg="/usr/bin/ag --column"


"

" set leader to ,
"let mapleader=","
let g:mapleader=","

" general
filetype plugin indent on " enable filetype-specific plugins
set history=50 " keep 50 lines of command line history
set number " enable line numbers
set autoindent " enable autoindent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4 " insert 2 spaces for a tab
set expandtab " use space instead of tab
set softtabstop=4
set shiftwidth=4 " the number of space characters inserted for indentation

"----------yolin molokai-----------
colors molokai " vim color scheme
"-------------- yolin end---------------

"----------yolin papaercolor-----------
set background=dark
"colorscheme PaperColor
"--------------yolin end----------

set autoread " auto read when file is changed from outside
set history=50 " keep 50 lines of command line history
"set mouse=a " mouse support
"if has("gui_running")
"  if has("gui_gtk2")
"    set guifont=Inconsolata\ 16
"  elseif has("gui_macvim")
"    set guifont=Menlo\ Regular:h16
"  elseif has("gui_win32")
"    set guifont=Consolas:h13:cANSI
"  endif
"  set t_Co=256 " 256 color mode
"endif
"if has("gui_macvim") " macvim shift movement
"  let macvim_hig_shift_movement = 1
"endif
set cursorline " highlight current line
set clipboard=unnamed " use +
"set clipboard+=unnamedplus "use *
set showmatch " Cursor shows matching ) and }
set showmode " Show current mode
" disable sound on errors
"set noeb vb t_vb=

" add spell checking and automatic wrapping at the
" recommended 72 columns to you commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" to move effeciently between splits
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

" status line {
set laststatus=2
set statusline=%<%F\ %h%m%r%y%=%-14.(%l,%c%V%)\ %P
" --- ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" --- PowerLine
let g:Powerline_symbols = 'fancy' " require fontpatcher

" --- vim-gitgutter
let g:gitgutter_enabled = 1
highlight clear SignColumn " For the same appearance as your line number column

" --- tagbar
"nmap <D-\> :TagbarToggle<CR>
"let g:tagbar_left=1

" --- ctrlp
let g:ctrlp_dont_split = 'NERD_tree_2'
let g:ctrlp_show_hidden = 1


" ------------------------------------------------yolin add --------------------------------------------


set nocompatible
set nu
set ruler
set tags=tags;
set write
set cmdheight=1
"set t_Co=256
set backspace=2
set ls=2
set magic "can change buffer not save
set hid
set ignorecase
set tagstack
"set wildmenu
"set esckeys
" Sets how many lines of history VIM has to remember.vimrc
set history=700
set display=lastline
set virtualedit=block
" Set to auto read when a file is changed from the outside
if exists("&autoread")
set autoread
endif 

"no sound on errors
set noerrorbells
set novisualbell


"
" Plugins config
"
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
" vim-airline
let g:airline#extensions#tabline#enabled=0
let g:airline#extensions#tabline#fnamecollapse=1
let g:airline#extensions#tabline#formatter='unique_tail'
"let g:airline_section_b=0
" whitspace counter
let g:airline_section_warning=0


"env
"au BufRead *.html set filetype=htmlm4
"au BufRead *.htm set filetype=htmlm4
"set switchbuf+=newtab,usetab,newtab
"buf都開在新的tab
"set switchbuf+=useopen,newtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"set lbr
set tw=500

set wrap "Wrap lines


set list
set listchars=tab:\|\ 

"supertab
"minibuf
                
au BufWinEnter \[Buf\ List\] setl nonumber


"a.vim
let g:alternateSearchPath = 'sfr:./h,sfr:./include,sfr:./source,sfr:./src,sfr:./,sfr:./inc,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

"auto remove blank on line end
"autocmd FileType c,cpp,java,php,perl,python,ruby,sh,html,htm autocmd BufWritePre  :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

let g:EasyMotion_leader_key = 'f'

"NERD.vim
let NERDTreeWinPos="left"
"let NERDTreeMouseMode=3
"let NERDTreeShowBookmarks=1
"autorun
"autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p

"map
set winaltkeys=no

nnoremap <space><space> :noh<cr>:call MySwitchToWorkBuf()<cr>

nnoremap `<esc> :qa<cr>

noremap <leader><xF1> <esc>:NERDTreeFind<cr>
noremap <xF1> <esc>:NERDTreeToggle<cr>
noremap <xF2> <esc>:TagbarToggle<cr>:call MySwitchToWorkBuf()<cr>
"noremap <xF3> <esc>:!grep --color -irsnI <c-r>+ <c-r>=getcwd()<cr>
noremap <xF3> <esc>:Ag "<c-r>+" <c-r>=getcwd()<cr>
"noremap <F4> <esc>:set noexpandtab softtabstop=4 shiftwidth=4 tabstop=4
noremap <F4> <esc>:set expandtab!<cr>
noremap <F5> <esc>:Search <c-r>+<cr>
noremap <F6> <esc>:SearchReinit<cr>:SearchReset<cr>
"noremap <F7> <esc>:<cr>
noremap <F8> <esc>:call MySwitchToWorkBuf()<cr>:BufExplorer<cr>
noremap <F9> <esc>:!~/.nvim/gencs.sh <c-r>=getcwd()<cr>
noremap <F10> <esc>:call ReloadAllCSCOPE("ISD2")<cr>
noremap <F11> <esc>:call ReloadAllCSCOPE("SmartOpenWrt")<cr>
noremap <F12> <esc>:call ReloadCSCOPE()<cr>


inoremap <xF1> <esc>:call MySwitchToWorkBuf()<cr>:NERDTreeToggle<cr>
inoremap <leader><c-xF1> <esc>:NERDTreeFind<cr>
inoremap <xF2> <esc>:call MySwitchToWorkBuf()<cr>:TagbarToggle<cr>
inoremap <xF3> <esc>:Ag "<c-r>+" <c-r>=getcwd()<cr>
inoremap <F4> <esc>:set expandtab!<cr>
inoremap <F5> <esc>:Search <c-r>+<cr>
inoremap <F6> <esc>:SearchReinit<cr>:SearchReset<cr>
"inoremap <F7> <esc>:<cr>
inoremap <F8> <esc>:call MySwitchToWorkBuf()<cr>:BufExplorer<cr>
inoremap <F9> <esc>:!~/.nvim/gencs.sh <c-r>=getcwd()<cr>
inoremap <F10> <esc>:call ReloadAllCSCOPE("ISD2"")<cr>
inoremap <F11> <esc>:call ReloadAllCSCOPE("SmartOpenWrt")<cr>
inoremap <F12> <esc>:call ReloadCSCOPE()<cr>

vnoremap <F5> y<esc>:Search <c-r>0<cr>
vnoremap <xF3> y<esc>:Ag "<c-r>0" <c-r>=getcwd()<cr>

noremap <c-j> :GitGutterNextHunk<cr>
noremap <c-k> :GitGutterPrevHunk<cr>

noremap <m-a> :A<cr>
inoremap <m-a> <esc>:A<cr>

noremap <c-xDown> <c-w>j
noremap <c-xUp> <c-w>k
noremap <c-xLeft> <c-w>h
noremap <c-xRight> <c-w>l

inoremap <c-xDown> <esc><c-w>j
inoremap <c-xUp> <esc><c-w>k
inoremap <c-xLeft> <esc><c-w>h
inoremap <c-xRight> <esc><c-w>l

noremap <leader>jj <c-w>j
noremap <leader>kk <c-w>k
noremap <leader>hh <c-w>h
noremap <leader>ll <c-w>l

"noremap <m-xLeft> <esc>:tabprevious<cr>
"noremap <m-xRight> <esc>:tabnext<cr>
"inoremap <m-xLeft> <esc>:tabprevious<cr>
"inoremap <m-xRight> <esc>:tabnext<cr>


noremap <m-xUp> <esc>:bp<cr>
noremap <m-xDown> <esc>:bn<cr>
noremap <m-xLeft> <esc>:vertical res -3<cr>
noremap <m-xRight> <esc>:vertical res +3<cr>


inoremap <m-xUp> <esc>:bp<cr>
inoremap <m-xDown> <esc>:bn<cr>
inoremap <m-xLeft> <esc>:vertical res -3<cr>
inoremap <m-xRight> <esc>:vertical res +3<cr>

"nnoremap <c-v> <c-r>+
vnoremap <c-x> "+x
vnoremap <c-c> "+y
vnoremap <c-v> "+p
"vnoremap <c-x> "*x
"vnoremap <c-c> "*y
"vnoremap <c-v> "*p

inoremap <c-z> <esc>ui
inoremap <c-v> <esc>:set paste<cr>a<c-r>+<esc>:set nopaste<cr>

"nnoremap <leader>u <ESC>:silent! !~/.nvim/gentag.sh <c-r>=getcwd()<cr> &<cr>
inoremap <c-s> <ESC>:update<cr>
nnoremap <c-s> :update<cr>
"nnoremap <leader><space> <ESC>:redraw!<cr>
nnoremap <leader>q <ESC>:bd<cr>
nnoremap <leader>aq <ESC>:qa<cr>

"au Filetype html,htm,xml,xsl source ~/.nvim/scripts/closetag.vim
"autocmd VimEnter * source ~/.nvim/Session.vim 
au BufRead * set expandtab softtabstop=4 shiftwidth=4 tabstop=4
au BufRead *.make set filetype=make noexpandtab
au BufRead *.mk set filetype=make noexpandtab
au BufRead *.ISD set filetype=make noexpandtab
au BufRead Makefile set filetype=make noexpandtab
au BufRead Makefile* set filetype=make noexpandtab
au BufRead *.in set noexpandtab
au BufRead *.conf set noexpandtab
au BufRead *.htm set filetype=javascript noexpandtab
au BufRead *.html set filetype=javascript noexpandtab
au BufRead *.cgi set filetype=javascript noexpandtab
au BufRead *js.htm set filetype=javascript noexpandtab
au BufRead *js.html set filetype=javascript noexpandtab
au BufRead *css.htm set filetype=javascript noexpandtab
au BufRead *css.html set filetype=javascript noexpandtab
au BufRead *.in set syntax=kconfig

"au VimEnter * NERDTreeFind
"
"au BufWritePost *.c,*.cpp,*.h silent! !cscope -bkq -i /CSCOPE/ISD2/MIPS32_APPS/sysconfig/cscope.files -f /CSCOPE/ISD2/MIPS32_APPS/sysconfig/cscope.out &
set cscopequickfix=s-,c-,d-,i-,t-,e-
"
let g:myGenCSCOPE_DB = "~/CSCOPE/"
let g:myGenIndex = 1

function! ReloadAllCSCOPE(var)
    let CSFOLDER=system('find ' .g:myGenCSCOPE_DB. ' -name "*.out" |grep ' . a:var)
    silent! cs kill -1
    let l:csfolder = substitute(CSFOLDER, "\n", "  ", "g")
    let s:csarray = split(l:csfolder)
    for i in range(0, len(s:csarray)-1)
        execute "silent! cs add "s:csarray[i]
    endfo
    "cs show
endfunction

function! MyGetInput(start,end,idx)
    let tmp = [0,0] "index,option  -1:quit,0:do nothing,1:enter,2:edit,3:switch,4:back switch
    let tmp[0] = a:idx
    let gc = getchar()
    let nc = nr2char(gc)
    let i = '0'

    if gc=="\<right>" || nc == 'l'
        let tmp[1] = 3
    elseif gc=="\<left>" || nc == 'h'
        let tmp[1] = 4
    elseif gc == "\<backspace>"
        let tmp[1] = 5
    elseif nc == "i" || nc == 'a' || nc == "\r" || nc == "\n"
        let tmp[1] =  2
    elseif gc == "\<up>" || nc == 'k'
        let tmp[0] -= 1
        if(tmp[0]<a:start)
            let tmp[0] = a:end
        endif
        let tmp[1] =  0
    elseif gc == "\<down>" || nc == 'j'
        let tmp[0] += 1
        if(tmp[0]>a:end)
            let tmp[0] = a:start
        endif
        let tmp[1] = 0
    elseif nc == nr2char(27)  || nc == "q" "escape
        let tmp[1] = -1
    elseif nc == '0'
        if(0<=a:end)
            let tmp = [0,2]
        endif
    elseif nc == '1'
        if(1<=a:end)
            let tmp = [1,2]
        endif
    elseif nc == '2'
        if(2<=a:end)
            let tmp = [2,2]
        endif
    elseif nc == '3'
        if(3<=a:end)
            let tmp = [3,2]
        endif
    elseif nc == '4'
        if(4<=a:end)
            let tmp = [4,2]
        endif
    elseif nc == '5'
        if(5<=a:end)
            let tmp = [5,2]
        endif
    elseif nc == '6'
        if(6<=a:end)
            let tmp = [6,2]
        endif
    elseif nc == '7'
        if(7<=a:end)
            let tmp = [7,2]
        endif
    elseif nc == '8'
        if(8<=a:end)
            let tmp = [8,2]
        endif
    elseif nc == '9'
        if(9<=a:end)
            let tmp = [9,2]
        endif
    endif
    return tmp
endfunc

function! ShowMyGenTag()
    let startidx = 0
    let endidx = 4
    let tmp = ['CS action:', ' 1) Show', ' 2) Add',' 3) Delete',' 4) Quit']
    let string = ' '
    let i = 0
    while i <= endidx
        if( g:myGenIndex == i )
            let string = '>'.tmp[i]
        else
            let string = ' '.tmp[i]
        endif
        echo string
        let i += 1
    endwhile

    let idxdo = [0,0] "return index and options
    let idxdo =  MyGetInput(startidx,endidx,g:myGenIndex)
    let g:myGenIndex = idxdo[0]

    return idxdo[1]
endfunc

function! RecCSCOPE()
    let action = ShowMyGenTag()
    let recursive = 1
    let i = 1
    if(action == 2 || action == 5)
        if(g:myGenIndex == 1)
            redraw!
            execute 'cs show'
        elseif(g:myGenIndex == 2)
            "set cscopetag
            "set csto = 0
            "set nocsverb
            let cstemp = input("Dir?", expand("%:p:h"), "file")
            let currentDir = expand(getcwd())
            let db = g:myGenCSCOPE_DB . cstemp
            redraw!
            execute 'cd ' . g:myGenCSCOPE_DB . cstemp
            while i < 15
                if filereadable(expand(db . "cscope.out"))
                    execute 'silent! cs add ' . db
                    let i = 15
                else
                    let db = db . "/../"
                    execute 'cd ..'
                    let i += 1
                endif
            endwhile
            execute 'cd ' . currentDir
        elseif(g:myGenIndex == 3)
            let cstemp = input("Delete?")
            redraw!
            execute 'cs kill ' . cstemp
        elseif(g:myGenIndex == 4)
            redraw!
            let recursive = 0
        else
            redraw!
            let recursive = 0
        endif
    elseif(action == -1)
        redraw!
        let recursive = 0
    else
        redraw!
    endif

    return recursive
endfunction

function! ReloadCSCOPE()
    call MySwitchToWorkBuf()
    execute "cs show"
    let myGenTagDir = expand(getcwd())
    let tmp = 1
    while tmp != 0
        let tmp = RecCSCOPE()
        if(tmp == 0)
            redraw!
            return
        endif
    endwhile
endfunction

if has("cscope")
    set cscopeverbose
    nmap <LEADER>s :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    nmap <C-\> :cs find s <C-R>=expand("<cword>")<CR><CR>:bot cw<CR>:wincmd j<CR>
    nmap <LEADER>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-]> :cs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <LEADER>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <LEADER>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <LEADER>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <LEADER>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif

let g:notes_directories = ['~/Documents/Notes']


nnoremap <leader>. :YcmCompleter GoToDefinitionElseDeclaration<CR>

set hlsearch
" =============================================================================
" SET THE GUI COLOR SCHEME
" =============================================================================
"
filetype on
filetype plugin on
filetype indent on
syntax on
set autochdir
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" global variable
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:myMenuIndex = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" switchtoworkbuf by Yolin 
"
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MySwitchToWorkBuf()
    let tempname = bufname("%")
    let nerdname = tempname

    if( strlen(nerdname) > 10 )
        let nerdname = strpart(nerdname,0,10)
    endif

    if(tempname == '' || nerdname == 'NERD_tree_' || tempname == '-MiniBufExplorer-' || tempname == '__Tagbar__')
        2 wincmd w
    endif

    let tempname = bufname("%")
    let nerdname = tempname

    if( strlen(nerdname) > 10 )
        let nerdname = strpart(nerdname,0,10)
    endif

    if(nerdname == 'NERD_tree_')
        execute "wincmd l"
    endif
    if(tempname == '__Tagbar__')
        execute "wincmd h"
    endif
    if(tempname == '-MiniBufExplorer-')
        execute "wincmd j"
    endif
    if(tempname == 'TransWindow')
        bd
    endif
    if(tempname == '.reddit')
        bd
        unmap o
        unmap O
    endif
    return 0
endfunction
command! -nargs=* -complete=file MySwitchToWorkBuf call MySwitchToWorkBuf()

"-------------- yolin end---------------
