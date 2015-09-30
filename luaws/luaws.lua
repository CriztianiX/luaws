local class = require("luaws.class")
local lfs  = require("lfs")
local SNS = require("luaws.services.sns")
local table = table

return class.Luaws {
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
    self._options = {}
    self._cmd = "aws"
  end,
  SNS = function(self)
    return SNS.new(self)
  end,
  setService = function(self, service)
    self._service = service
  end,
  setMethod = function(self, method)
    self._method = method
  end,
  setOption = function(self, key, value)
    self._options[key] = value
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

    local options = self:flatOptions(self._options)
    local t = {
      self._cmd,
      self._service,
      self._method,
      options
    }
    local cmd = table.concat(t, " ")
    return cmd
  end,
  executor = function(self)
    local os = os
    local io = io
    local tmpname = os.tmpname ()
    local f = io.open(tmpname, "w")
    local cmd = self:buildCommand()
    local access_key = "export AWS_ACCESS_KEY_ID="..self._access_key
    local access_secret = "export AWS_SECRET_ACCESS_KEY="..self._access_secret
    local region = "export AWS_DEFAULT_REGION="..self._region

    local t = {
      access_key, access_secret, region, cmd
    }
    local lines = table.concat(t, "\n")

    f:write(lines)
    f:close()

    local popen = io.popen
    local handle = popen("bash " .. tmpname)
    local result = handle:read("*a")
    handle:close()
    os.remove(tmpname)
    return result
  end
}
