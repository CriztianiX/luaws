local clean_up = function(...)
  local os = os
  for i,v in ipairs(arg) do
    os.remove(v)
  end
end

local read_file = function(file)
  local io = io
  local popen = io.open(file, "r")
  local result = popen:read()
  popen:close()
  return result
end

local exec = function(cmd)
  local popen = io.popen
  local handle = popen(cmd)
  local result = handle:read("*a")
  handle:close()
  return result
end

return function(tmpname, status_tmpfile)
  local result = exec("bash " .. tmpname)
  local status_code = read_file(status_tmpfile)
  clean_up(tmpname, status_tmpfile)
  if tonumber(status_code) ~= 0 then
    error("error code: " .. status_code)
  end
  return result
end
