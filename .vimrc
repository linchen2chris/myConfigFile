set nu
syntax on
set cindent
set noexpandtab
set sw=4
set tabstop=4
set softtabstop=4
set hlsearch
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1  
"set fdm=syntax
"F9一键编译
let Tlist_Ctags_Cmd='/users/denver/lguojia/linchen/ctags-5.8/ctags'
set tags=~/mytags,./tags
map <F2> :Tlist<cr>
map <F8> :NERDTree<cr>
map <F8> :NERDTreeToggle<cr>
let NERDTreeWinPos ="right"
let NERDTreeShowBookmarks=1
let NERDChristmasTree=1
let NERDTreeBookmarksFile='~/bookmarks.txt'
nnoremap <silent> <F3> :Grep<CR>
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
set cscopequickfix=s-,c-,d-,i-,t-,e-

map <f9> :call Compile()<cr>
map <f10> :call Run()<cr>
map <f11> :call CompileRun()<cr>

	"定义CompileRun函数，调用进行编译
func Compile()
	exec "w"
	"C程序
	if &filetype == 'c'
	exec "!gcc % -Wall -O2 -s -o %<"
	"C++程序
	elseif &filetype == 'cpp'
	exec "!g++ % -Wall -O2 -s -o %<"
	endif
	endfunc

	"定义Run函数
func Run()
	exec "!%<"
	endfunc

	"定义CompileRun函数
func CompileRun()
	exec "w"
	if &filetype == 'c'
	exec "!gcc % -Wall -O2 -s -o %<"
	exec "!%<"
	elseif &filetype == 'cpp'
	exec "!g++ % -Wall -O2 -s -o %<"
	exec "!%<"
	endif
	endfunc
	
