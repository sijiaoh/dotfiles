anyenv_root = "~/.anyenv"

unless File.exist? anyenv_root
  Utils.git_clone path: anyenv_root, url: "https://github.com/anyenv/anyenv.git"
  Utils.exec "#{File.join(anyenv_root, 'bin/anyenv')} install --force-init"
  Dir.mkdir File.join(anyenv_root, "plugins")
  Utils.git_clone path: File.join(anyenv_root, "plugins/anyenv-update"), url: "https://github.com/znz/anyenv-update.git"
end
