function! Ghostwriter()
    
    function! Geeknote()
        let script = "gnsync" 
        \ . " --path " . g:ghostwriter_path 
        \ . " --notebook " . g:ghostwriter_notebook
        \ . " --format markdown" 
        \ . " --logpath ~/.geeknote/geeknote.log"
        \ . " --two-way TWO_WAY"
        \ . " &"

        exec 'call  system( script )'
    endfunction

    let path = expand('%:p:h')
    let dir = fnamemodify(g:ghostwriter_path, ':p:h')
    let g:ghostwriter_loaded = 1

    if path == dir 
        call Geeknote()
    endif
endfunction

autocmd VimLeave * :call Ghostwriter()
