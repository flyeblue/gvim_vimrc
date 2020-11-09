
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
"python自动补全
Plug 'davidhalter/jedi-vim'
"模糊搜索插件
Plug 'ctrlpvim/ctrlp.vim'
"Python代码自动格式化
Plug 'tell-k/vim-autopep8'
" Python语法检测插件
Plug 'nvie/vim-flake8'
" 括号/引号自动补齐
Plug 'jiangmiao/auto-pairs'
"多色彩括号匹配插件
Plug 'kien/rainbow_parentheses.vim'
"Python PEP8规范自动格式化
Plug 'tell-k/vim-autopep8'
"注释插件
Plug 'preservim/nerdcommenter'
"git
Plug 'tpope/vim-fugitive'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Initialize plugin system
call plug#end()
" 文件类型检测
filetype on
" 语法高亮
syntax on
"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
"set cursorline


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

set nocompatible
set backspace=2
"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"搜索忽略大小写
set ignorecase
"关闭折行
set nowrap
"显示命令
set showcmd
"搜索逐字符高亮
set incsearch
"添加或更新头
map <F4> :call TitleDet()<cr>
autocmd BufNewFile *.py exec ":call AddTitle()"
"进行版权声明的设置
function AddTitle()
    call append(0,"#!/usr/bin/python")
    call append(1,'# vim: set fileencoding=utf8 :')
    call append(2,"#=============================================================================")
    call append(3,"# Author:  flyeblue")
    call append(4,"#")
    call append(5,"# email : flyeblue@hotmail.com")
    call append(6,"# Created Time: ".strftime("%c"))
    call append(7,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"# Filename: ".expand("%:t"))
    call append(9,"#")
    call append(10,"# Description: ")
    call append(11,"#")
    call append(12,"#=============================================================================")
    call append(13,'"""')
    call append(14,' ')
    call append(15,'"""')
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
