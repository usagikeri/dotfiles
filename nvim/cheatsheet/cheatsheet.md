# 文字数のカウント
:%s/./&/g

# 連番生成

g<C-a>


# 選択範囲置換

空白をアンダーバーに置換する例

```
'<,'>:s/ /_/g
```

# fzf key-map

like find command

```
nnoremap <silent><C-f>f :FzfFiles<CR>
nnoremap <silent><C-f>b :FzfBuffers<CR>
nnoremap <silent><C-f>t :FzfTags<CR>
noremap <silent><C-f>l :FzfBLines<CR>
```

# Ack

grep

```
:Ack Keyword
```
