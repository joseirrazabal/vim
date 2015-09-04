" author: qbbr <imqbbr@gmail.com>

function! s:Sf2jmp2viewFromController()
    mark C
  
    " action
    let actionline = search('\wAction', 'b', line("w1"))
  
    " action not found
    if (actionline == 0)
        normal! g`C 
        echohl WarningMsg | echomsg "not found!" | echohl None
        return
    endif

    let actioncontent = getline(actionline)
    let actionname = matchlist(actioncontent, '\v(\w+)Action')
 
    " controller
    let controllerline = search('\wController', 'b', 0)
    let controllercontent = getline(controllerline)
    let controllername = matchlist(controllercontent, '\v(\w+)Controller')
 
    " namespace
    let namespaceline = search('namespace .*', 'b', line("w0"))
    let namespacecontent = getline(namespaceline)
    let namespacename = matchlist(namespacecontent, '\v(\w+)\\(\w+)\\.*')
 
    " filename
    let $filename = 'src/' . namespacename[1] . '/' . namespacename[2] . '/Resources/views/' . controllername[1] . '/' . actionname[1] . '.html.twig'

    if filereadable($filename)
        "edit $filename
        tabnew $filename
    else
        echohl WarningMsg | echomsg "file not found!" | echohl None
    endif
endfunction

com! Sf2jmp2viewFromController call s:Sf2jmp2viewFromController()

" complete a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :Sf2jmp2viewFromController<CR>
