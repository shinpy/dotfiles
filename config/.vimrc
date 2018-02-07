set nocompatible

set list
set listchars=tab:>-

set ruler
set number

set tabstop=4

" map <Up> <Nop>
" map <Down> <Nop>
" map <Left> <Nop>
" map <Right> <Nop>
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>

"ステータスラインにコマンドを表示
set showcmd
"ステータスラインを常に表示
set laststatus=2
"ファイル名表示
set statusline+=%<%F
"ファイルフォーマット表示
set statusline+=[%{&fileformat}]
"ファイルタイプ表示
set statusline+=%y

"ここからツールバー右側
set statusline+=%=

"現在文字行/全体行表示
set statusline+=[L=%l/%L]
"現在行が全体行の何%か表示
set statusline+=[%p%%]

" vimdiff の色設定
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7

