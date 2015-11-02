local class = require("luaws.class")
local Response = require "luaws.response"
local dkjson = require "luaws.deps.dkjson"
local moses = require "luaws.deps.moses"
local exec = require "luaws.exec"
local table = table

local escapeString = function(string)
  return "'" .. string .. "'"
end

return class.Luaws_Core {
  initialize = function(self, config)
    if not config.access_key then
      error("access_key is required for config")
    end
    if not config.access_secret then
      error("access_secret is required for config")
    end
    if not config.region then
      error("region is required for config")
    end
    self._access_key = config.access_key
    self._access_secret = config.access_secret
    self._region = config.region
    self._service = false
    self._method = false
    self._skel = {}
    self._options = {}
    self._args = {}
  end,
  setService = function(self, service)
    self._service = service
  end,
  getMethod = function(self)
    return self._method
  end,
  setOption = function(self, key, value)
    self._options[key] = value
  end,
  setArg = function(self, key, value)
   self._args[key] = value
  end,
  getArgs = function(self)
   return self._args
  end,
  getOptions = function(self)
    return self._options
  end,
  setMethod = function(self, method)
    self._method = method
  end,
  setSkel = function(self, skel)
    self._skel = skel
  end,
  getSkel = function(self)
    return self._skel
  end,
  cleanSkel = function(self)
    self._options = {}
  end,
  flatOptions = function(self)
    local flat = ""
    for key, value in pairs(self._options) do
      flat = flat .. " " .. key .. " " .. value
    end
    return flat
  end,
  buildCommand = function(self)
    if not self._service then
      error("Service unknown or not set")
    end
    if not self._method then
      error("Method unknown or not set")
    end

    local args = table.concat(self._args, " ")
    local options = self:flatOptions(self._options)

    local input
    if not moses.isEmpty(self._skel) then
      local t = { "--cli-input-json", escapeString(dkjson.encode(self._skel))
      }
      input = table.concat(t, " ")
    end

    local t = {
      "aws",
      self._service,
      self._method,
      args,
      options,
      input
    }
    local cmd = table.concat(t, " ")
    return cmd
  end,
  buildScript = function(self, status_tmpfile)
    local os = os
    local io = io
    local tmpname = os.tmpname ()
    local f = io.open(tmpname, "w")
    local cmd = self:buildCommand()
    if os.getenv("USE_DEBUG") then
      print(cmd)
    end
    local access_key = "export AWS_ACCESS_KEY_ID='"..self._access_key.."'"
    local access_secret = "export AWS_SECRET_ACCESS_KEY='"..self._access_secret.."'"
    local region = "export AWS_DEFAULT_REGION='"..self._region.."'"
    local sstatus = "echo $? > " .. status_tmpfile
    local t = {
      access_key, access_secret, region, cmd,
      sstatus
    }
    local lines = table.concat(t, "\n")

    f:write(lines)
    f:close()
    return tmpname
  end,
  executor = function(self)
    local status_tmpfile = os.tmpname ()
    local tmpname = self:buildScript(status_tmpfile)
    local result = exec(tmpname, status_tmpfile)
    return self:toTable(result)
  end,
  toTable = function(self, response)
      local result = Response.new(response)
      return result:get()
  end
}
