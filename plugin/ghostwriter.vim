function! Ghostwriter()
    
    function! Sync()
        let script = "gnsync" 
        \ . " --path " . g:ghostwriter_path 
        \ . " --notebook " . g:ghostwriter_notebook
        \ . " --format markdown" 
        \ . " --logpath ~/.geeknote/geeknote.log"
        \ . " --two-way TWO_WAY"
        \ . " &"

        exec 'call  system( script )'
    endfunction

    function! ValidDirectory()
        let path = expand('%:p:h')
        let dir = fnamemodify(g:ghostwriter_path, ':p:h')
        let g:ghostwriter_loaded = 1

        if path == dir 
           return 0 
        else 
           return 1 
        endif

    endfunction

    if exists("g:ghostwriter_path") && exists("g:ghostwriter_notebook")
        if call ValidDirectory()
           call Sync 
        endif
    endif



endfunction

autocmd VimLeave * :call Ghostwriter()
