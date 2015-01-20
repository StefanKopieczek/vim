AutoComment
===========

A vim plugin to automatically add and format block comments.

Currently very aggressive and not always correct, although still orders of magnitude easier than manually writing comment blocks.  
Can be toggled with `:ToggleAutoComment` (on by default).  
Can be disabled by default by putting `let g:autocomment_disabled = 1` in your .vimrc.  
Individual filetypes can be disabled by putting `let g:autocomment_<filetype>_disabled` in your .vimrc. e.g. `let g:autocomment_python_disabled`.
