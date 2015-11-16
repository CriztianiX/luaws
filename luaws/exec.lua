require 'compat53'

local clean_up = function(file)
  local os = os
  return os.remove(file)
end

local read_file = function(file)
  local io = io
  local popen = io.open(file, "r")
  local result = popen:read("*a")
  popen:close()
  return result
end

local exec = function(command)
  local os = os
  local tmpfile = os.tmpname()
  local success, signal, status = os.execute(command .. " >"..tmpfile.." 2>&1")
  local result = read_file(tmpfile)
  clean_up(tmpfile)
  return success, signal, status, result
end

return function(command)
  local success, signal, status, result = exec(command)
  if status ~= 0 then
    error(result .. " error code: " .. status)
  end

  return result
end
