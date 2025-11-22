# 対話シェルのときのみ有効にする
# claude code内からの呼び出しに失敗するため
# https://github.com/anthropics/claude-code/issues/2407
if [[ $- == *i* ]]; then
  eval "$(zoxide init zsh --cmd cd)"
fi
