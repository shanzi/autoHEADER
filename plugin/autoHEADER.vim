"--------------------------------------------------------------------------------
"     File Name           :     autoHEADER.vim
"     Created By          :     shanzi
"     Creation Date       :     [2012-10-04 01:07]
"     Last Modified       :     [2013-04-05 00:47]
"     Description         :     Envoke autoHEADER and define command
"--------------------------------------------------------------------------------

if exists('g:autoHEADER_loaded')
    finish
endif


if !exists('g:autoHEADER_auto_enable')
    let g:autoHEADER_auto_enable=1
endif

if !exists('g:autoHEADER_fill_char_repeat')
    let g:autoHEADER_fill_char_repeat = 80
endif


if !exists('g:autoHEADER_default_author')
    let g:autoHEADER_default_author=$USER
endif


if g:autoHEADER_auto_enable
    call autoHEADER#enable()
endif


command AutoHeader call autoHEADER#make_header()
command AutoHeaderEnable call autoHEADER#enable()
command AutoHeaderDisable call autoHEADER#disable()
let g:autoHEADER_loaded=1.0
