source ~/.config/nvim/mappings.vim
lua require('plugins')
lua require('gitsigns').setup()
lua require('git').setup()


"" Colour Scheme
lua require("onedarkpro").setup({dark_theme="onedark_dark"})
set termguicolors
colorscheme onedarkpro
lua require('colorizer').setup()

"" Base
set autoindent
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
set breakindent
set autoindent
set smartindent
set nowrap
set winblend=0
set wildoptions=pum
set pumblend=5
set list

"" LaTeX stuff
let g:latex_to_unicode_auto = 1 "" unicode symbols autotransform while typing
let g:tex_flavor='latex'
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmgs'
hi clear Conceal

if !exists("g:vim_window_id")
  let g:vim_window_id = system("xdotool getactivewindow")
endif

function! s:TexFocusVim() abort
  " Give window manager time to recognize focus moved to Zathura;
  " tweak the 200m as needed for your hardware and window manager.
  sleep 200m

  " Refocus Vim and redraw the screen
  silent execute "!xdotool windowfocus " . expand(g:vim_window_id)
  redraw!
endfunction

augroup vimtex_event_focus
  au!
  au User VimtexEventView call s:TexFocusVim()
augroup END


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

"" Remove trailing spaces
lua vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]]})
