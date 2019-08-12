# 文字数のカウント
:%s/./&/g

# 連番生成

```
g<C-a>
```

# Bufferを閉じる

```
:bd
```

# 選択範囲置換

空白をアンダーバーに置換する例

```
'<,'>:s/ /_/g
```

# fzf key-map

like find command

```
nnoremap <silent><C-f>a :FzfAg<CR> //grep current dir
nnoremap <silent><C-m> :FzfBuffers<CR> //buffer
nnoremap <silent><C-f>c :FzfCommands<CR> //vim command
nnoremap <silent><C-f>f :FzfFiles<CR> //file
nnoremap <silent><C-f>h :FzfHelptags<CR> //vim help
nnoremap <silent><C-f>l :FzfLines<CR> //line in buffers
nnoremap <silent><C-f>j :FzfLines<CR> //line in current burrer
nnoremap <silent><C-f>t :FzfTags<CR> //tags
```

# Ack

grep

```
:Ack Keyword
```

# Memo

map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>
