local zprezto_root = "~/.zprezto"

assert(AutoInstall("zsh"))

if not CheckFileExists(zprezto_root) then
  assert(Exec("git clone --recursive https://github.com/sorin-ionescu/prezto.git " .. zprezto_root))
end

local runcoms_str = Run("find " .. zprezto_root .. "/runcoms -type f -not -name README.md")
local runcoms = Split(runcoms_str, "\n")
for _, runcom in ipairs(runcoms) do
  Exec("ln -sfv " .. runcom .. " ~/." .. BaseName(runcom))
end

CreateSymlink("zshrc.zsh", "~/.zshrc")
CreateSymlink("p10k.zsh", "~/.p10k.zsh")
CreateSymlink("zpreztorc.zsh", "~/.zpreztorc")
