local class = require("luaws.class")
return class.Luaws_Base_Service {
  initialize = function(self, client)
    self._client = client
    self._client:setService(self.service)
  end,
  executor = function(self, client, params, options)
    local params = params or {}
    client:cleanOptions()
    for key, value in pairs(params) do
      if not options[key] then
        error("Option " .. key .. " not supported!")
      end
      client:setOption(options[key], value)
    end
    return client:executor()
  end
}
