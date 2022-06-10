local anyenv_root = "~/.anyenv"

if not CheckFileExists(anyenv_root) then
  assert(GitClone(anyenv_root, "https://github.com/anyenv/anyenv"))
  assert(Exec(anyenv_root .. "/bin/anyenv install --force-init"))
end

MkdirP(anyenv_root .. "/plugins")
assert(GitClone(anyenv_root .. "/plugins/anyenv-update", "https://github.com/znz/anyenv-update.git"))
