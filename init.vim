source ~/.config/nvim/mappings.vim
source ~/.config/nvim/whitespace.vim
lua require('plugins')
lua require('gitsigns').setup()
lua require('git').setup()

"" Colour Scheme
lua require("onedarkpro").setup({dark_theme="onedark_vivid"})
colorscheme onedarkpro
set termguicolors
lua require('colorizer').setup()

"" Base
set number
set relativenumber
set hlsearch
set cmdheight=1
set laststatus=2
set expandtab
set backspace=indent,eol,start
set shiftwidth=2
set tabstop=2
set scrolloff=10
set ignorecase
set smartcase
set breakindent
set autoindent
set smartindent
set nowrap
set winblend=0
set wildoptions=pum
set pumblend=5
set list
set splitright
set splitbelow
set mouse=""

"" LaTeX stuff
let g:latex_to_unicode_auto = 1 "" unicode symbols autotransform while typing
let g:tex_flavor='latex'
let g:vimtex_view_method='skim' "" use zathura on Linux
let g:vimtex_view_skim_sync = 1
let g:vimtex_view_skim_activate = 0
let g:vimtex_quickfix_mode=0
set conceallevel=1
hi clear Conceal
let g:tex_conceal='abdmgs'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

"" Transparency
let g:transparent_enabled = v:true

"" Undotree
if has("persistent_undo")
   let target_path = expand('~/.undodir')

    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir=target_path
    set undofile
endif
