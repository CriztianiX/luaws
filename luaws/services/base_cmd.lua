local dkjson = require "luaws.deps.dkjson"
local class = require "luaws.class"
local BaseService = require "luaws.services.base"

return class.Luaws_BaseCmd_Service.extends(BaseService) {
  parse_options  = function(self, params, skel)
    for key,value in pairs(params) do
      if not skel[key] then
        error("param " .. key .. " is not supported")
      end

      if skel[key].type == "string" then
        self._client:setOption(skel[key].name, value)
      end

      if skel[key].type == "argument" then
        self._client:setArg(skel[key].index, value)
      end
    end
  end
}
