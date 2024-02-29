zprezto_root = "~/.zprezto"

Utils.auto_install "zsh"
Utils.git_clone path: zprezto_root, url: "https://github.com/sorin-ionescu/prezto.git"

runcoms_str = Utils.run "find #{File.join zprezto_root, 'runcoms'} -type f -not -name README.md"
runcoms = runcoms_str.split "\n"
runcoms.each do |runcom|
  Utils.exec "ln -sf #{runcom} #{File.join '~', ".#{File.basename(runcom)}"}"
end

Utils.create_symlink "zsh/zshrc.zsh", "~/.zshrc"
Utils.create_symlink "zsh/p10k.zsh", "~/.p10k.zsh"
Utils.create_symlink "zsh/zpreztorc.zsh", "~/.zpreztorc"
