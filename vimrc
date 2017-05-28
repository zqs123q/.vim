:set nocompatible " 取消vi兼容模式,这个放前面,要不会让后面有些设置失效,比如showcmd,和NERDTRee插件的小问题
filetype plugin on " 允许使用插件
:set rtp+=~/.vim/bundle/nerdtree


" 优化设置
:set nonumber " 不显示行号
:set shiftwidth=4 " 缩进长度
:set tabstop=4 " tab长度
":set softtabstop=4 " tab替换成4个空格
:set autoindent " 自动缩进
":set list " 显示tab
:set ruler " 显示光标位置
:set showcmd " 显示命令
:colorscheme molokai " 配色
:set hlsearch " 高亮搜索
:set incsearch " 实时搜索
:set scrolloff=5 " 光标上下行数
":set cursorline " 高亮当前行
:set nobackup " 取消备份
:set autoread " 文件自动检测外部更改
:set wildignorecase " 文件名补全忽略大小写


" 按键映射
" 优化上下逻辑
:noremap j gj
:noremap k gk
" 打开文件管理器
:map <F2> :NERDTreeToggle<CR>


" 自动命令
" 更改配置立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 方便定位当前窗口及分辨是否处于插入模式
" 进入窗口高亮当前行
autocmd WinEnter * set cursorline
" 离开窗口取消高亮
autocmd WinLeave * set nocursorline
" 插入模式取消高亮
autocmd InsertEnter * set nocursorline
" 离开插入模式恢复高亮
autocmd InsertLeave * set cursorline
