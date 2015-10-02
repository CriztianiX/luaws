local class = require("luaws.class")
local LuawsCore = require("luaws.core")

return class.Luaws {
  initialize = function(self, config)
    self._config = config
  end,
  SWF = function(self)
    return require("luaws.services.swf").new(LuawsCore.new(self._config))
  end,
  SNS = function(self)
    return require("luaws.services.sns").new(LuawsCore.new(self._config))
  end,
  S3 = function(self)
    return require("luaws.services.s3").new(LuawsCore.new(self._config))
  end
}
