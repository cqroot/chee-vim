" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    GuiFont! CaskaydiaCove Nerd Font:h11:w25
endif

" GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

map! <S-Insert> <C-R>+
