local anyenv_root = "~/.anyenv"

if GitClone(anyenv_root, "https://github.com/anyenv/anyenv") then
  Exec(anyenv_root .. "/bin/anyenv install --force-init")
end

MkdirP(anyenv_root .. "/plugins")
GitClone(anyenv_root .. "/plugins/anyenv-update", "https://github.com/znz/anyenv-update.git")
