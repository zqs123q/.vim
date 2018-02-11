set nocompatible " 取消vi兼容模式,这个放前面,要不会让后面有些设置失效,比如showcmd,和NERDTRee插件的小问题

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'yianwillis/vimcdoc'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'derekwyatt/vim-fswitch'
"Plugin 'kshenoy/vim-signature'
"Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-scripts/indexer.tar.gz'
"Plugin 'vim-scripts/DfrankUtil'
"Plugin 'vim-scripts/vimprj'
"Plugin 'dyng/ctrlsf.vim'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/DrawIt'
"Plugin 'SirVer/ultisnips'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'derekwyatt/vim-protodef'
Plugin 'scrooloose/nerdtree'
"Plugin 'fholgado/minibufexpl.vim'
"Plugin 'gcmt/wildfire.vim'
"Plugin 'sjl/gundo.vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'lilydjwg/fcitx.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on
" PluginInstall 安装插件

" 优化设置
syntax on " 语法高亮
set wrap " 回绕
set nonumber " 不显示行号
set shiftwidth=4 " 缩进长度
"set tabstop=4 " tab长度
"set softtabstop=4 " 混合tab和空格
"set expandtab " tab替换空格
set autoindent " 自动缩进
"set list " 显示tab
set ruler " 显示光标位置
set showcmd " 显示命令
let grehash256 = 1
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd
set hlsearch " 高亮搜索
set incsearch " 实时搜索
set scrolloff=5 " 光标上下行数
set nobackup " 取消备份
set autoread " 文件自动检测外部更改
set wildignorecase " 文件名补全忽略大小写
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb2312,gb18030,cp936,latin1


" 按键映射
" 优化上下逻辑
noremap j gj
noremap k gk
" 打开文件管理器
map <F2> :NERDTreeToggle<CR>

" 自动命令检查
if !exists("s:my_script")
    let s:my_script = 1
    " 保存会话并退出
    command MQ mksession! | qall
    function MksQuit()
        mksession!
        qall
    endfunction

    function Myecho()
        echo 1
    endfunction
    " 更改配置立即生效
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    " 空格代替tab
    autocmd BufReadPre * set expandtab
    " 对于makefile文件还原tab
    autocmd BufReadPre [Mm]akefile set noexpandtab
    " 方便定位当前窗口及分辨是否处于插入模式
    " 进入窗口高亮当前行
    autocmd WinEnter * set cursorline
    " 离开窗口取消高亮
    autocmd WinLeave * set nocursorline
    " 插入模式取消高亮
    autocmd InsertEnter * set nocursorline
    " 离开插入模式恢复高亮
    autocmd InsertLeave * set cursorline
endif

" 插入模式优化
inoremap ( ()U<Left>
inoremap { {}U<Left>
inoremap [ []U<Left>

" 可视模式优化
vnoremap p pgvygvv
