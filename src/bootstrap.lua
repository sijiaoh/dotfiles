require "./src/utils"

local function get_setup_dir(path)
  local splited_paths = Split(path, "/")
  table.remove(splited_paths, #splited_paths)
  return table.concat(splited_paths, "/")
end

DotfilesRoot = os.getenv("DOTFILES_ROOT")

local setup_paths_str = Run("ls */setup.lua")
local setup_paths = Split(setup_paths_str, "\n")
for _, path in ipairs(setup_paths) do
  SetupDir = get_setup_dir(path)

  local require_path = "./" .. Split(path, ".")[1]
  require(require_path)
end
