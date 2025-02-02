function MarkdownSetup()
	au BufWritePost *.md silent !~/util/md2html % %<.html
	set nonu
endfunction

au FileType markdown call MarkdownSetup()
