function! Ghostwriter()
    let g:ghostwriter_loaded = 1
    let obj = {}
    let s:notebook_path = g:ghostwriter_path . '/' . g:ghostwriter_notebook . '/'

    function! obj.newFile(file)
        echo a:file
        let file = s:notebook_path . a:file
        exec "sp " . file
    endfunction

    function! Sync()
        let script = "gnsync" 
        \ . " --path " . s:notebook_path 
        \ . " --notebook " . g:ghostwriter_notebook
        \ . " --format markdown" 
        \ . " --logpath ~/.geeknote/geeknote.log"
        \ . " --two-way TWO_WAY"
        \ . " &"

        exec 'call  system( script )'
    endfunction

    function! ValidDirectory()
        let path = expand('%:p:h')
        let dir = fnamemodify(s:notebook_path, ':p:h')

        if path == dir 
           return 1 
        else 
           return 0 
        endif

    endfunction

    if exists("g:ghostwriter_path") && exists("g:ghostwriter_notebook")
        if ValidDirectory()
           call Sync()
        endif
    endif

    return obj
endfunction

if exists('g:ghostwriter_loaded')
    finish
endif

autocmd VimLeave * :call Ghostwriter()
command! -nargs=1 Ghostwriter call Ghostwriter().newFile(<f-args>)
