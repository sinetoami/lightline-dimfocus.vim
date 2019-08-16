" ============================================================================
" Plugin: lightline-dimfocus.vim
" Author: Sinésio Neto (sinetoami) <https://github.com/sinetoami>
" Version: 0.0.1 - 2019 Jun 30
" License: MIT license
" Description: Propose dim the lightline.vim statusline of a inactive window.
" ============================================================================
if exists('g:lightline#dimfocus#enabled') || empty('lightline')
  finish
endif
let g:lightline#dimfocus#enabled = 1

let s:save_cpo = &cpo
set cpo&vim

if has('autocmd')
  function! s:LightlineDimFocusStart()
    augroup lightline#dimfocus
      autocmd!

      " Make current statusline/tabline more obvious by turning off/adjusting some features in non-current
      " statusline/tabline.
      if exists('*matchaddpos')
        autocmd FocusGained,WinEnter * call lightline#dimfocus#focus_statusline()
        autocmd FocusLost,WinLeave * call lightline#dimfocus#blur_statusline()
      endif

    augroup END
  endfunction

  call s:LightlineDimFocusStart()
endif

let &cpo = s:save_cpo
unlet s:save_cpo
