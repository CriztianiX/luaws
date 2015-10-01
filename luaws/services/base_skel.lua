local dkjson = require "luaws.deps.dkjson"
local moses = require "luaws.deps.moses"
local class = require "luaws.class"
local BaseService = require "luaws.services.base"

return class.Luaws_BaseSkel_Service.extends(BaseService) {
  parse_options = function(self, params, skel)
    -- Clenup unfilled params
    for key in pairs(skel) do
      if not params[key] then
        skel[key] = nil
      end
    end

    for key, value in pairs(params) do
      if not skel[key] then
        error("Option " .. key .. " not supported!")
      end
      skel[key] = value
      self._client:setSkel(skel)
    end
  end
}
