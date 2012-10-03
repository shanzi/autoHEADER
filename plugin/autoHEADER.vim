if exists('g:autoHEADER_loaded')
    finish
endif


if !exists('g:autoHEADER_auto_enable')
    let g:autoHEADER_auto_enable=1
endif

if !exists('g:code_header_fill_char_repeat')
    let g:code_header_fill_char_repeat = 80
endif

if !exists('g:autoheader_script_prefix')
    let g:autoheader_script_prefix = {'py' : '#! /usr/bin/env python',
                \                     'rb' : '#! /usr/bin/env ruby',
                \                     'pl' : '#! /usr/bin/env perl',
                \                     'sh' : '#! /usr/bin/env bash'}
endif


if g:autoHEADER_auto_enable
    augroup autoHEADER
        autocmd!
        autocmd BufNewFile *.* call autoHEADER#make_header()
    augroup END
endif


command AutoHeader autoHEADER#make_header()
let g:autoHEADER_loaded=1.0
