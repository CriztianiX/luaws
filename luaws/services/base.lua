local dkjson = require "dkjson"
local class = require "luaws.class"
local moses = require "luaws.deps.moses"
local load_skel = function(service, method)
  local skelpath = "luaws/services/specs/" ..
    service .. "_" .. method .. ".json"
  local io = io
  local file = io.open(skelpath, "r")
  local content = {}
  if file then
    content = dkjson.decode(file:read("*a"))
  end
  file:close()
  return content
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
