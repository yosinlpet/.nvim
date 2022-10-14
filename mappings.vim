let mapleader = " "

inoremap nn <ESC>

"" Navigate through windows
map <leader>h <C-w>h
map <leader>n <C-w>j
map <leader>e <C-w>k
map <leader>i <C-w>l

""" Split
map <leader>v :vs<Space>
map <leader>m :sp<Space>

""" Resize
map <leader><up> <C-w>+
map <leader><down> <C-w>-
map <leader><left> <C-w><
map <leader><right> <C-w>>

""" Colemak
noremap n j
noremap i l
noremap l u
noremap u i
noremap e k
noremap k n
noremap j e
noremap N J
noremap I L
noremap L U
noremap U I
noremap E K
noremap K N
noremap L I
noremap J E

nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>c :edit $MYVIMRC<CR>
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

"" Quickfix List
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>
