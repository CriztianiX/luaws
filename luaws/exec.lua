return function(tmpname)
  local popen = io.popen
  local os = os
  local handle = popen("bash " .. tmpname)
  local result = handle:read("*a")
  handle:close()
  os.remove(tmpname)
  return result
end
