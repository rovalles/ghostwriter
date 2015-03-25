# ghostwriter
Sync notes written in vim with Evernote through Geeknote.

### Required

[Geeknote] (http://www.geeknote.me/install/)

### Settings 
``` vim
let g:ghostwriter_path='path/to/folder'
let g:ghostwriter_notebook="vim"
```

### Create a new note
Creates a new note in the notebook thats been set.
``` vim
:Ghostwrite filename.txt
```

