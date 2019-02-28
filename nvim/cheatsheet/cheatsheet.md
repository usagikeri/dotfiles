# 文字数のカウント
:%s/./&/g

# fzf key-map
nnoremap <silent><Leader><C-f> :FzfFiles<CR>
nnoremap <silent><Leader><C-f>b :FzfBuffers<CR>
nnoremap <silent><Leader><C-f>t :FzfTags<CR>
nnoremap <silent><Leader><C-f>l :FzfBLines<CR>
