se enc=utf-8
se lcs+=space:.,tab:+-
se bs=2
se ru

se et
se ts=4
se sw=0

se is
se hls

let mapleader=" "
nn <Leader>q :q<CR>
nn <Leader>w :w<CR>

nn <CR> :noh<CR>
nn <Up> :se list!<CR>
nn <Left> :se nu!<CR>
nn <Right> :if exists("g:syntax_on") <Bar> sy off <Bar> else <Bar> sy on <Bar> endif<CR>
