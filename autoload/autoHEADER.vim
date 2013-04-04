"--------------------------------------------------------------------------------
"     File Name           :     autoHEADER.vim
"     Created By          :     shanzi
"     Creation Date       :     [2012-10-03 23:53]
"     Last Modified       :     [2013-04-05 00:46]
"     Description         :     Auto insert comment header block for varies
"                               programing language
"--------------------------------------------------------------------------------



let s:style_list = [
            \    { 'style' : ['/*' , '*' , '*/' , '*' ] , 'ft' : [ 'c' , 'java' , 'cpp' , 'javascript' , 'go' , 'php' , 'jsp' ] , 
            \      'prefix' : {
            \                 'php' : '<?php',
            \                 'jsp' : '<%',
            \                 },
            \      'appendix' : {
            \                 'php' : '?>',
            \                 'jsp' : '%>',
            \                 }},
            \    { 'style' : ['#'  , '#' , ''  , '#' ] , 'ft' : [ 'python' ,'python.django','ruby', 'perl' , 'sh','coffee' ] , 
            \      'prefix' : {
            \                 'python' : '#! /usr/bin/env python',
            \                 'ruby' : '#! /usr/bin/env ruby',
            \                 'perl' : '#! /usr/bin/env perl',
            \                 'sh' : '#! /bin/bash',
            \                   }},
            \    { 'style' : ['"'  , '"' , ''  , '-' ] , 'ft' : [ 'vim' , 'tex' ] },
            \    { 'style' : ['<!--'  , '*' , '-->'   , '*' ] , 'ft' : [ 'html' , 'md' ] },
            \    { 'style' : ['---[[' , ''  , '---]]' , ''  ]  , 'ft' : [ 'lua' ]},
            \]


fun! s:insert_header_with_ft(ft)   
    for styledict in s:style_list
        let ftlist = get(styledict,'ft')
        let indexofft = index(ftlist, a:ft)
        if indexofft >= 0
            let style = get(styledict,'style')
            let prefix = get(styledict,'prefix')
            let appendix = get(styledict,'appendix')
            let start_char = style[1]
            let start_line = 0

            let messages=[['File Name' , s:filename],
                        \ ['Created By' , g:autoHEADER_default_author],
                        \ ['Creation Date' , '[' . strftime("%Y-%m-%d %H:%M") . ']'],
                        \ ['Last Modified' , '[AUTO_UPDATE_BEFORE_SAVE]'],
                        \ ['Description' , ' '],]

            if  type(prefix) == type({})
                let prefix_by_ft = get(prefix,a:ft)
                if  type(prefix_by_ft)==type('') && len(prefix_by_ft)>0
                    call append(0 , prefix_by_ft)
                    let start_line += 1
                endif
            endif

            " start of comment block
            call append(start_line, style[0] . repeat(style[3], g:autoHEADER_fill_char_repeat))
            let start_line += 1

            for message in messages
                call append(start_line, start_char . repeat(' ',5) . printf('%-20s:     %s',get(message,0),get(message,1)))
                let start_line += 1
            endfor

            " save cursor pos
            let endline = start_line

            " end of comment block
            call append(start_line,start_char . repeat(style[3], g:autoHEADER_fill_char_repeat) . style[2])
            let start_line += 1

            " appendix
            if type(appendix)==type({})
                let appendix_by_ft = get(appendix,a:ft)
                if type(appendix_by_ft)==type('') && len(appendix_by_ft)
                    call append(start_line,appendix_by_ft)
                endif
            endif

            call append(start_line+1,'')
            
            " restore line
            call cursor(endline,0)
            exe "normal $"
            return 1
        endif
    endfor
    return 0
endfun


fun! autoHEADER#make_header()
    let s:filename=expand('%')
    call s:insert_header_with_ft(&ft)
endfun

fun! autoHEADER#enable()
    augroup autoHEADER
        autocmd!
        autocmd BufNewFile *.* call autoHEADER#make_header()
        autocmd Bufwritepre,filewritepre *.* call autoHEADER#update_modified_time()
    augroup END
endfun

fun! autoHEADER#disable()
    augroup autoHEADER
        autocmd!
    augroup END
endfun



fun! autoHEADER#update_modified_time()
    let cursor_pos = getpos('.')
    silent! exe "1,10s/\\(Last Modified\\s\\+:\\s\\+\\)\\[[^\\]]\\+\\]/\\1[" . strftime("%Y-%m-%d %H:%M") . "]/" 
    call setpos('.',cursor_pos)
endfun
