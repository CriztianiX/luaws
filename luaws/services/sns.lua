local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
return class.Luaws_SNS.extends(BaseSkel) {
  service = "sns",
  listTopics = function(self, params)
    self._client:setMethod("list-topics")
    return self:executor(self._client, params)
  end,
  subscribe = function(self, params)
    self._client:setMethod("subscribe")
    return self:executor(self._client, params)
  end,
  createTopic = function(self, params)
    self._client:setMethod("create-topic")
    return self:executor(self._client, params)
  end,
  deleteTopic = function(self, params)
    self._client:setMethod("delete-topic")
    return self:executor(self._client, params)
  end
}
