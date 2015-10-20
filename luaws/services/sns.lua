local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local methods = {
  service = "sns",
  createPlatformEndpoint = function(self, params)
    self._client:setMethod("create-platform-endpoint")
    return self:executor(params)
  end,
  listTopics = function(self, params)
    self._client:setMethod("list-topics")
    return self:executor(params)
  end,
  subscribe = function(self, params)
    self._client:setMethod("subscribe")
    return self:executor(params)
  end,
  createTopic = function(self, params)
    self._client:setMethod("create-topic")
    return self:executor(params)
  end,
  deleteTopic = function(self, params)
    self._client:setMethod("delete-topic")
    return self:executor(params)
  end
}
return class.Luaws_SNS.extends(BaseSkel)(methods)
