function f() {
  eval "$(/usr/bin/ruby3.0 ${DOTFILES_ROOT}/fzf/fzf_command_generator.rb $@)"
}
