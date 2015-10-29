local class = require("luaws.class")
local LuawsCore = require("luaws.core")
local Luaws = class.Luaws({
  initialize = function(self, config)
    self._config = config
  end
})

local s = {"SWF", "SNS", "S3", "SQS"}
for i=1,#s do
  local ss = s[i]
  Luaws[ss] = function(self)
    local sss = "luaws.services." .. ss:lower()
    return require(sss).new(LuawsCore.new(self._config))
  end
end
return Luaws
