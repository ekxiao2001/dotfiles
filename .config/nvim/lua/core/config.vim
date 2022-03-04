" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
        set splitbelow
		exec "!g++ % -o %<"
        :sp
        :res -5
        :terminal ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -5
		:terminal ./%<
    elseif &filetype == 'lua'
        set splitbelow
        :sp
        :res - 5
        :terminal lua %
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		:term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        set splitbelow
        :sp
        :term go run .
    endif
endfunc
