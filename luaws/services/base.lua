local dkjson = require "dkjson"
local class = require "luaws.class"

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
  executor = function(self, client, params)
    local params = params or {}
    client:cleanSkel()
    -- Load the skel if exists
    local skel = load_skel(self.service, client:getMethod())
    for key, value in pairs(params) do
      if not skel[key] then error("Option " .. key .. " not supported!") end
      skel[key] = value
    end

    client:setSkel(skel)
    return client:executor()
  end
}
