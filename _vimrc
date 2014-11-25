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

"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim


"禁止生成临时文件
set nobackup

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set incsearch

"行内替换
set gdefault

"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
set cursorline


"自动缩进
set noautoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"使用4个空格代替Tab
set expandtab
set softtabstop=4
"输入法设置
if has('multi_byte_ime')
	"未开启IME时光标背景色
	hi Cursor guifg=bg guibg=Orange gui=NONE
	"开启IME时光标背景色
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" 关闭Vim的自动切换IME输入法(插入模式和检索模式)
	set iminsert=0 imsearch=0
	" 插入模式输入法状态未被记录时，默认关闭IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"配色方案
syntax enable
set background=dark

"##########插件管理 开始#############
filetype off
set nocompatible
set rtp+=$HOME/vim/vimfiles/bundle/vundle
call vundle#rc("$HOME/vim/vimfiles/bundle/")

"插件管理核心库
Bundle 'gmarik/vundle'

"代码补全
"Bundle 'Valloric/YouCompleteMe'
Bundle 'Shougo/neocomplcache'

"statuslines 增强
Bundle 'scrooloose/vim-statline'

"文件管理器
Bundle 'scrooloose/nerdtree'
"Nerdtree 增强
Bundle 'jistr/vim-nerdtree-tabs'
"autocmd vimenter * NERDTree

"python 
Bundle 'klen/python-mode'
"代码折叠起始的层数
set foldlevelstart=10

"颜色管理
Bundle 'altercation/vim-colors-solarized'

"激活插件与文件类型的依赖关系
filetype plugin indent on

"----------插件设置开始
"
"自定义关联文件类型
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

"A-t : 打开NERDTree
map <silent> <C-t>   <ESC>:NERDTree<CR>
" 以打开NERDTree时的目录为工作目录
let NERDTreeChDirMode=1
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"自动开启Nerdtree
autocmd vimenter * NERDTree
"切换Nerdtree焦点到文件编辑
autocmd VimEnter * wincmd p

"mm : 规范行首空格<cr>去除多余字符<cr>删除空白行<cr>规范行数
nmap mm :%s/\r//g<cr>

"ff : 前后补全
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->tag->_('<C-R>z');?><ESC>

"##########插件管理 结束#############



function Windows_set()
    "集中配置Windows的设置，公共设置则不在这里
    "设置字体
    set guifont=Inconsolata:h12
    "设置临时文件夹目录
    set directory=c:\temp
    "自动重新加载vimrc.似乎只对编辑vimrc的时候起作用，同时的其他窗口无效，暂时保留
    autocmd! bufwritepost _vimrc source $VIM/_vimrc
    "配色方案
    colorscheme solarized
    "启动后全屏
    au GUIEnter * simalt ~x
    "与Windows共享剪贴板
    "set clipboard+=unnamed
endfunction

function! MaximizeWindow()
silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
    
function Other_set()
    "集中设置非windows系统设置
    "设置临时目录
    set directory=~/tmp,/tmp
    "配色方案
    if g:isGUI
        colorscheme solarized
    else
        colorscheme torte
    endif
    "启动后全屏
    au GUIENTER * call Maximizewindow()
endfunction

"进行版权声明的设置
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
"更新最近修改时间和文件名
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
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
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
"在文件扩展名是py的时候，在文件保存或者更新的时候自动更新文件头,实验失败。
"autocmd BufWritePre,FileWritePre *.py ks|call AddTitle()|'s 
map <F4> :call AddTitle()<cr>

if g:iswindows
    call Windows_set()
else
    call Other_set()
endif

"模板相关
autocmd BufNewFile *.py 0r $HOME/data/vim/vimfiles/template/moban.py
