"=============================================================================
" File: dimfocus.vim
" Author: Sinésio Neto (sinetoami) <https://github.com/sinetoami>
" License: MIT license
"=============================================================================
function! s:reaload_lightline() abort
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

let s:current_palette = deepcopy(get(g:, 'lightline#colorscheme#' . g:lightline.colorscheme . '#palette')) 
let s:dimfocus = get(g:, 'lightline#dimfocus#blur', s:current_palette)

function! lightline#dimfocus#focus_statusline() abort
  let l:palette = lightline#palette()
  
  let l:palette.tabline.left = s:current_palette.tabline.left  
  let l:palette.tabline.tabsel = s:current_palette.tabline.tabsel
  
  let l:palette.normal.left = s:current_palette.normal.left
  let l:palette.normal.right = s:current_palette.normal.right
 
  unlet l:palette
  
  call s:reaload_lightline()
endfunction

function! lightline#dimfocus#blur_statusline() abort
  let l:palette = lightline#palette()
  
  let l:palette.tabline.left = s:dimfocus.tabline.left
  let l:palette.tabline.tabsel = s:dimfocus.tabline.tabsel 
  
  let l:palette.normal.left = s:dimfocus.normal.left 
  let l:palette.normal.right = s:dimfocus.normal.right 

  unlet l:palette
 
  call s:reaload_lightline()
endfunction
