local read_file = function(file)
  local popen = io.open(file, "r")
  local result = popen:read()
  popen:close()
  return string.gsub(result, "n", "")
end

return function(tmpname, status_tmpfile)
  local popen = io.popen
  local os = os
  local handle = popen("bash " .. tmpname)
  local result = handle:read("*a")
  handle:close()
  local status_code = read_file(status_tmpfile)
  os.remove(tmpname)
  os.remove(status_tmpfile)

  if status_code ~= 0 then
    error("error code: " .. status_code)
  end
  return result
end
