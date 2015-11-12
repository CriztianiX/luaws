local  Luaws_Services_Factory = require 'luaws.services.factory'

local class = require("luaws.class")
local Luaws_Core = require("luaws.core")
local Luaws = class.Luaws({
  initialize = function(self, config)
    self._config = config
  end
})

local s = Luaws_Services_Factory.services()
for i=1,#s do
  local ss = s[i]
  Luaws[ss] = function(self)
    return Luaws_Services_Factory.create(ss, Luaws_Core.new(self._config))
  end
end
return Luaws
