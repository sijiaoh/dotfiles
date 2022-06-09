function Exec(command)
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
  return Exec("dirname " .. path)
end

function MkdirP(path)
  Exec("mkdir -p " .. path);
end

function CreateSymlink(from, to)
  assert(SetupDir ~= nil)

  MkdirP(DirName(to));

  local absolute_path = table.concat({ DotfilesRoot, SetupDir }, "/")
  local command = "ln -sfv " .. absolute_path .. "/" .. from .. " " .. to
  local output = Exec(command)

  print(output)
end
