"--------------------------------------------------------------------------------
"     File Name           :     autoHEADER.vim
"     Created By          :     shanzi
"     Creation Date       :     [2012-10-03 23:53]
"     Last Modified       :     [2012-10-04 01:05]
"     Description         :     Auto insert comment header block for varies
"                               programing language
"--------------------------------------------------------------------------------



let s:style_list = [
\    { 'style' : ['/*' , '*' , '*/' , '*' ] , 'ext' : [ 'c' , 'java' , 'cpp' , 'js' , 'h' , 'go' ] , },
\    { 'style' : ['#'  , '#' , ''  , '#' ] , 'ext' : [ 'py' , 'rb', 'pl' , 'sh' ] , 'prefix' : g:autoheader_script_prefix },
\    { 'style' : ['"'  , '"' , ''  , '-' ] , 'ext' : [ 'vim' , 'tex' ] },
\    { 'style' : ['<!--'  , '*' , '-->'   , '*' ] , 'ext' : [ 'html' , 'md' ] },
\    { 'style' : ['---[[' , ''  , '---]]' , ''  ]  , 'ext' : [ 'lua' ]},
\]

fun! s:put_msg_line(start_char,key,value)
    exe "normal o"
    exe "normal cc" . a:start_char . repeat(' ',5) 
                \ . printf('%-20s:     %s',a:key,a:value)
endfun


fun! s:insert_header_with_ext(ext)
    for styledict in s:style_list
        let extlist = get(styledict,'ext')
        let indexofext = index(extlist, a:ext)
        if indexofext >= 0
            let style = get(styledict,'style')
            let prefix = get(styledict,'prefix')

            " Jump to line 1
            exe 'normal ggO'                                

            if type(prefix) == 4 && len(prefix) 

                let prefix_by_ext = get(prefix,a:ext)
                if len(prefix_by_ext)
                    exe 'normal i' . prefix_by_ext 
                    exe 'normal o'
                endif
            endif
            
            " Begining of the comment block
            exe "normal i" . style[0]
                        \ . repeat(style[3],g:code_header_fill_char_repeat)

            " Message Segment
            let start_char = style[1]
            
            " + File Name
            call s:put_msg_line(start_char,'File Name',s:filename)

            " + Created By
            if exists('g:autoheader_default_author')
                call s:put_msg_line(start_char,'Created By',g:autoheader_default_author)
            else
                call s:put_msg_line(start_char,'Created By', $USER)
            endif

            " + Creation Date
            call s:put_msg_line(start_char,'Creation Date','[' . strftime("%Y-%m-%d %H:%M") . ']')

            " + Last Modified
            call s:put_msg_line(start_char,'Last Modified','[AUTO_UPDATE_BEFORE_SAVE]')

            " + LICENCE
            if exists('g:autoheader_default_licence')
                call s:put_msg_line(start_char,'LICENCE',g:autoheader_default_licence)
            endif

            " + Description
            call s:put_msg_line(start_char,'Description','')

            " end of comment segment
            exe "normal o"
            exe 'normal cc' . style[1]
                        \ . repeat(style[3],g:code_header_fill_char_repeat)
                        \ . style[2]         
            exe 'normal o'
            exe 'normal cc'
            exe 'normal 2k$'

            return 1
        endif
    endfor
    return 0
endfun


fun! autoHEADER#make_header()
    let s:filename=expand('%')
    let s:ext=tolower(substitute(s:filename,'^.\+\.\(\w\+\)$','\1',''))
    call s:insert_header_with_ext(s:ext)
endfun

fun! autoHEADER#update_modified_time()
    exe "1,10s/\\(Last Modified\\s\\+:\\s\\+\\)\\[[^\\]]\\+\\]/\\1[" . strftime("%Y-%m-%d %H:%M") . "]/" 
endfun
