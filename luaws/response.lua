local class = require("luaws.class")
local dkjson = require("luaws.deps.dkjson")
return class.Luaws_Response{
    initialize = function(self, str)
      self._str = str
    end,

    get = function(self)
      return dkjson.decode(self._str)
    end
}
