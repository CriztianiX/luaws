local allen = require 'luaws.deps.allen'
local class = require 'middleclass'
local moses = require 'luaws.deps.moses'
local Luaws_Service = class('Luaws_Service')

local dasherize = function(op)
  return allen.dasherize(op)
end

local parse_json_input = function(params)
  local skel = {}
  for key, value in pairs(params) do skel[key] = value end
  return skel
end

function Luaws_Service:initialize()

  for _, op in pairs(self.class.static.methods) do
    self[op] = function(self, params)
      self._core:setMethod(dasherize(op))
      self._core:setService(self.class.static.service)
      local params = params or {}
      if not moses.isEmpty(params)  then
        if self.class.static.service_type == "json" then
          local skel = parse_json_input(params)
          self._core:setSkel(skel)
        end
      end
      return self._core:executor()
    end
  end
end

function Luaws_Service:setCore(core)
  self._core = core
end

function Luaws_Service:getMethodStructure(method)
  self._core:setService(self.class.static.service)
  self._core:setMethod(dasherize(method))
  self._core:setArg(1, "--generate-cli-skeleton")
  return self._core:executor()
end

return Luaws_Service
