function f() {
  eval "$(ruby ${DOTFILES_ROOT}/fzf/fzf_command_generator.rb $@)"
}
