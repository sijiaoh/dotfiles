function Exec(command)
  return os.execute(command) == true
end

-- Exec command and return stdout.
function Run(command)
  local handle = io.popen(command)
  assert(handle ~= nil)
  local result = handle:read("*a")
  handle:close()

  return result
end

-- From: https://stackoverflow.com/a/7615129
function Split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

function DirName(path)
  return Run("dirname " .. path)
end

function MkdirP(path)
  Run("mkdir -p " .. path);
end

function CreateSymlink(from, to)
  assert(SetupDir ~= nil)

  MkdirP(DirName(to));

  local absolute_path = table.concat({ DotfilesRoot, SetupDir }, "/")
  local command = "ln -sfv " .. absolute_path .. "/" .. from .. " " .. to
  local output = Run(command)

  print(output)
end

function CheckFileExists(path)
  return Exec("test -e " .. path)
end

function GitClone(path, url)
  return Exec("git clone " .. url .. " " .. path)
end
