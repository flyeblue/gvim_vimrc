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
set rtp+=$TOOLSPATH/data/vim/vimfiles/bundle/vundle
call vundle#rc("$TOOLSPATH/data/vim/vimfiles/bundle/")

"插件管理核心库
Bundle 'gmarik/vundle'
"代码补全
Bundle 'Shougo/neocomplcache'
"快速查找
Bundle 'kien/ctrlp.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"插件 语法/高亮
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
"Bundle 'Markdown'
"Bundle 'Markdown-syntax'
"Bundle 'plasticboy/vim-markdown'
Bundle 'StanAngeloff/php.vim'
Bundle 'php.vim-html-enhanced'
"statuslines 增强
Bundle 'scrooloose/vim-statline'
"文件管理器
Bundle 'scrooloose/nerdtree'
"Nerdtree 增强
Bundle 'jistr/vim-nerdtree-tabs'
"在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'
"Code check for most languages
Bundle 'scrooloose/syntastic'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_post_args='--standard=psr2'
let g:syntastic_javascript_checkers = ['eslint']
"PHP CodeSniffer
"Bundle 'joonty/vim-phpqa'
Bundle 'jcf/vim-latex'

Bundle 'thinca/vim-quickrun'
Bundle 'mattn/webapi-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'superbrothers/vim-quickrun-markdown-gfm'

"python 
Bundle 'klen/python-mode'
"代码折叠起始的层数
set foldlevelstart=10
"Bundle 'hallettj/jslint.vim'

"即时预览CSS颜色
"Bundle 'skammer/vim-css-color'
"Bundle 'ZenCoding.vim'
"Bundle 'The-NERD-tree'
"Bundle 'SuperTab'

"语法检查
"Bundle 'scrooloose/syntastic'

"颜色管理
Bundle 'altercation/vim-colors-solarized'
"激活插件与文件类型的依赖关系
filetype plugin indent on
"##########插件管理 结束#############

"自定义关联文件类型
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.phtml set filetype=php
au BufRead,BufNewFile *.js set ft=javascript.jquery
au BufRead,BufNewFile *.py set ft=python

"--------插件设置
"---NeoComplCache 启动并使用Tab触发
let g:neocomplcache_enable_at_startup = 1 
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
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
autocmd BufNewFile *.py 0r $TOOLSPATH/data/vim/vimfiles/template/moban.py
