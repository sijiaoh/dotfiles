if IsLinux() then
  assert(Exec("sudo curl --output /usr/local/bin/git-filter-repo https://raw.githubusercontent.com/newren/git-filter-repo/main/git-filter-repo"))
else
  assert(BrewInstall("git-filter-repo"))
end

CreateSymlink(".gitconfig")
CreateSymlink(".gitignore")
