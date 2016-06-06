" Backwards compatibility
command! RunAllNoseTests :call RunNoseTestBuffer()
command! RunFocusedNoseTests :call RunNoseTestFocused()

command! RunNoseTest :call _run_nosetests("")
command! RunNoseTestBuffer :call RunNoseTestBuffer()
command! RunNoseTestFocused :call RunNoseTestFocused()

function! RunNoseTestBuffer()
  call _run_nosetests(expand("%"))
endfunction

function! RunNoseTestFocused()
  let test_class = _nose_test_search("class ")
  let test_name = _nose_test_search("def test_")

  if test_class == "" || test_name == ""
    echoerr "Couldn't find class and test name to run focused test."
    return
  endif

  call _run_nosetests(expand("%") . ":" . test_class . "." . test_name)
endfunction

function! _nose_test_search(fragment)
  let line_num = search(a:fragment, "bs")
  if line_num > 0
    ''
    return split(split(getline(line_num), " ")[1], "(")[0]
  else
    return ""
  endif
endfunction

function! _run_nosetests(test)
  call VimuxRunCommand(_virtualenv() . "nosetests " . a:test)
endfunction

function! _virtualenv()
  if exists("g:NoseVirtualenv")
    return g:NoseVirtualenv . " "
  else
    return ""
  end
endfunction
