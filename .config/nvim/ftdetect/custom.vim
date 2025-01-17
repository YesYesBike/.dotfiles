au BufRead,BufNewFile *.h	        set filetype=c
au BufRead,BufNewFile *.asm	        set filetype=nasm
au FileType html					set softtabstop=2 shiftwidth=2 tabstop=2 nonu
au FileType lua						setlocal cms=--%s
au FileType c						setlocal cms=//%s
au FileType scheme					call SchemeSetup()
au FileType markdown				call MarkdownSetup()

function SchemeSetup()
	"setlocal equalprg=scmindent
	inoremap <buffer> (				()<Left>
	inoremap <buffer> )				<C-[>ca(
	inoremap <buffer> <C-l>			<Right>
	nnoremap <buffer> <leader>la	ci(()<C-[>P
	xnoremap <buffer> <leader>la	"zc()<C-[>"zP
	nnoremap <buffer> dj			"jda(
	nnoremap <buffer> yj			"jya(
	nnoremap <buffer> dJ			"jPmzgg=G`z
	nnoremap <buffer> d'			f'd%
	nnoremap <buffer> d"			F'd%
endfunction

function MarkdownSetup()
	au BufWritePost,FileWritePost *.md silent !~/util/md2html % %<.html
	set nonu
endfunction
