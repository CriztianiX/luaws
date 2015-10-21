local dkjson = require "luaws.deps.dkjson"
local class = require "luaws.class"
local moses = require "luaws.deps.moses"
local load_skel = function(service, method)
  local skel = "luaws.services.specs." .. service .. "_" .. method
  local ok, mod = pcall(require, skel)
  if not ok then mod = {} end
  return mod
end
return class.Luaws_Base_Service {
  initialize = function(self, client)
    self._client = client
    self._client:setService(self.service)
  end,
  parse_options = function(self, params, skel)
    error("parse options not implemented")
  end,
  executor = function(self, params)
    local params = params or {}
    -- If params is empty we dont look for skel
    if not moses.isEmpty(params)  then
      -- Load the skel if exists
      local skel = load_skel(self.service, self._client:getMethod())
      self:parse_options(params, skel)
    end
    return self._client:executor()
  end
}
