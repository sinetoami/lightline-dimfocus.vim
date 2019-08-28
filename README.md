# lightline-dimfocus.vim
Inspired to extend the focusing event on [lightline.vim][] plugin. Provides 
a simple way to customize the statusline and tabline when a window is inactive.

## Requirements
- [lightline.vim][]

## Installation
Use your favorite plugin manager, and add to your `.vimrc`: 

### [dein.vim][]
```vim
call dein#add('itchyny/lightline.vim')
call dein#add('sinetoami/lightline-dimfocus.vim')
```
Run `:so %` and `:call dein#install()`.

### [vim-plug][]
```vim
Plug 'itchyny/lightline.vim'
Plug 'sinetoami/lightline-hunks.vim'
```
Run `:so %` and `:PlugInstall`.

## Configuration
This plugin will attach to a coloscheme defined by the `lightline.colorscheme` variable.

### `g:lightline#dimfocus#blur` [dictionary]
Defines the colorscheme to inactive windows. Will use the `lightline.vim` 
colorscheme style convention.
```vim
"" colorscheme style convention predefined by lightline.vim:
let s:palette.{mode}.{where} = [ [{guifg}, {guibg}, {ctermfg}, {ctermbg}, {fontstyle}}], ... ]
```
For more information, see `:help lightline`.

1. The `lightline-dimfocus.vim` provide these components to customize:
 - `{mode}` 
     - options: `normal`, `tabline`.
 - `{where}`
     - *normal* mode: `left`, `right`; 
     - *tabline* mode: `tabsel`, `left`.
 - `{gui(fg|bg)}` 
     - hexadecimal color number.
 - `{cterm(fg|bg)}` 
     - decimal color number.
 - `{fontstyle}` - *[optional]* 
     - `bold`, `italic`, `underline` or a combination of two or three 
         of them. *[optional]*

2. Needs to define the `g:lightline#dimfocus#blur` variable to active dim 
   event to a inactive window.
#### Example
```vim
"" Defining a basic colorscheme
let s:lgray = ['#929192', 255]
let s:mgray = ['#221f22', 232]
let s:dgray = ['#19181A', 232]
let s:green = ['#a9dc76', 148]

"" Setting the g:lightline#dimfocus#blur variable:
let g:lightline#dimfocus#blur = 
\{
\ 'tabline': {
\   'left': [ [s:lgray[0], s:dgray[0], s:lgray[1], s:dgray[1]] ],
\   'tabsel': [ [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1], 'bold'] ],
\ },
\ 'normal': {
\   'left': [ 
\     [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1], 'bold'], 
\     [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1]], 
\   ],
\   'right': [ 
\     [s:lgray[0], s:mgray[0], s:mgray[1], s:mgray[1], 'bold'], 
\     [s:lgray[0], s:mgray[0], s:lgray[1], s:mgray[1]], 
\     [s:lgray[0], s:dgray[0], s:lgray[1], s:dgray[1]] 
\    ],
\ },
\}
```

### `g:lightline#dimfocus#enabled`
Set this variable if you want to disable this plugin. Default is `1`.

## Contributing
- To ask about the contents of the configuration, send me a feedback, 
    request features or report bugs, please open a GitHub issue.
- Open a pull-request if you want to improve this plugin. 
    I will glad to see your idea.

## Self-Promotion
Do you like this plugin? Come on:
- Star and follow the repository on [GitHub](https://github.com/sinetoami/lightline-dimfocus.vim).
- Follow me on
  - [GitHub](https://github.com/sinetoami)

## License
[MIT License](LICENSE)

[lightline.vim]: https://github.com/itchyny/lightline.vim
[dein.vim]: https://github.com/Shougo/dein.vim
[vim-plug]: https://github.com/junegunn/vim-plug
