if Utils.linux?
  Utils.exec "sudo curl --output /usr/local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo"
else
  Utils.brew_install "git-filter-repo"
end

Utils.auto_install "git-lfs"
