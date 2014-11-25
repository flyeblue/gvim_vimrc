let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

set nocompatible
source $VIMRUNTIME/vimrc_example.vim

"���ù���Ŀ¼Ϊ��ǰ�༭�ļ���Ŀ¼
set bsdir=buffer
set autochdir

"��������
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"��������
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"��ֹ������ʱ�ļ�
set nobackup

"�������Դ�Сд
set ignorecase

"�������ַ�����
set incsearch

"�����滻
set gdefault

"ʼ����ʾ�к�
set number

"��ʾ��������
set ruler

"��������
set cursorline


"�Զ�����
set noautoindent
set cindent
set smartindent

"Tab���Ŀ��
set shiftwidth=4
set tabstop=4

"ʹ��4���ո����Tab
set expandtab
set softtabstop=4
"���뷨����
if has('multi_byte_ime')
	"δ����IMEʱ��걳��ɫ
	hi Cursor guifg=bg guibg=Orange gui=NONE
	"����IMEʱ��걳��ɫ
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" �ر�Vim���Զ��л�IME���뷨(����ģʽ�ͼ���ģʽ)
	set iminsert=0 imsearch=0
	" ����ģʽ���뷨״̬δ����¼ʱ��Ĭ�Ϲر�IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"��ɫ����
syntax enable
set background=dark

"##########������� ��ʼ#############
filetype off
set nocompatible
set rtp+=$HOME/vim/vimfiles/bundle/vundle
call vundle#rc("$HOME/vim/vimfiles/bundle/")

"���������Ŀ�
Bundle 'gmarik/vundle'

"���벹ȫ
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/neocomplcache'

"statuslines ��ǿ
Bundle 'scrooloose/vim-statline'

"�ļ�������
Bundle 'scrooloose/nerdtree'
"Nerdtree ��ǿ
Bundle 'jistr/vim-nerdtree-tabs'
"autocmd vimenter * NERDTree

"python 
Bundle 'klen/python-mode'
"�����۵���ʼ�Ĳ���
set foldlevelstart=10

"��ɫ����
Bundle 'altercation/vim-colors-solarized'

"���������ļ����͵�������ϵ
filetype plugin indent on

"----------������ÿ�ʼ
"
"�Զ�������ļ�����
au BufRead,BufNewFile *.py set ft=python

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
  let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"A-t : ��NERDTree
map <silent> <C-t>   <ESC>:NERDTree<CR>
" �Դ�NERDTreeʱ��Ŀ¼Ϊ����Ŀ¼
let NERDTreeChDirMode=1
"�ر�vimʱ������򿪵��ļ�����NERDTreeû�������ļ�ʱ�����Զ��ر�
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"�Զ�����Nerdtree
autocmd vimenter * NERDTree
"�л�Nerdtree���㵽�ļ��༭
autocmd VimEnter * wincmd p

"mm : �淶���׿ո�<cr>ȥ�������ַ�<cr>ɾ���հ���<cr>�淶����
nmap mm :%s/\r//g<cr>

"ff : ǰ��ȫ
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->tag->_('<C-R>z');?><ESC>

"##########������� ����#############



function Windows_set()
    "��������Windows�����ã�����������������
    "��������
    set guifont=Inconsolata:h12
    "������ʱ�ļ���Ŀ¼
    set directory=c:\temp
    "�Զ����¼���vimrc.�ƺ�ֻ�Ա༭vimrc��ʱ�������ã�ͬʱ������������Ч����ʱ����
    autocmd! bufwritepost _vimrc source $VIM/_vimrc
    "��ɫ����
    colorscheme solarized
    "������ȫ��
    au GUIEnter * simalt ~x
    "��Windows���������
    "set clipboard+=unnamed
endfunction

function! MaximizeWindow()
silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
    
function Other_set()
    "�������÷�windowsϵͳ����
    "������ʱĿ¼
    set directory=~/tmp,/tmp
    "��ɫ����
    if g:isGUI
        colorscheme solarized
    else
        colorscheme torte
    endif
    "������ȫ��
    au GUIENTER * call Maximizewindow()
endfunction

"���а�Ȩ����������
function AddTitle()
    call append(0,"# -*- coding: utf-8 -*-")
    call append(1,'"""')
    call append(2,"#=============================================================================")
    call append(3,"# Author:  - @.com")
    call append(4,"#")
    call append(5,"# QQ : ")
    call append(6,"#")
    call append(7,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"#")
    call append(9,"# Filename: ".expand("%:t"))
    call append(10,"#")
    call append(11,"# Description: ")
    call append(12,"#")
    call append(13,"#=============================================================================")
    call append(14,'"""')
    call append(15,' ')
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"��������޸�ʱ����ļ���
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"�ж�ǰ10�д������棬�Ƿ���Last modified������ʣ�
"���û�еĻ�������û����ӹ�������Ϣ����Ҫ����ӣ�
"����еĻ�����ôֻ��Ҫ���¼���
function TitleDet()
    let n=1
    "Ĭ��Ϊ���
    while n < 11
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
"���ļ���չ����py��ʱ�����ļ�������߸��µ�ʱ���Զ������ļ�ͷ,ʵ��ʧ�ܡ�
"autocmd BufWritePre,FileWritePre *.py ks|call AddTitle()|'s 
map <F4> :call AddTitle()<cr>

if g:iswindows
    call Windows_set()
else
    call Other_set()
endif

"ģ�����
autocmd BufNewFile *.py 0r $HOME/data/vim/vimfiles/template/moban.py
