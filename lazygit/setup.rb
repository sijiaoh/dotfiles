Utils.exec "./lazygit/linux.sh" if Utils.linux?
Utils.brew_install "lazygit"

if Utils.linux?
  Utils.create_symlink "lazygit/config.yml", "~/.config/lazygit/config.yml"
else
  Utils.create_symlink "lazygit/config.yml", "~/Library/Application\\ Support/lazygit/config.yml"
end
