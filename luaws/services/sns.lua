local class = require("luaws.class")
local Base = require("luaws.services.base")
return class.Luaws_SNS.extends(Base) {
  service = "sns",
  listTopics = function(self, params)
    self._client:setMethod("list-topics")
    return self:executor(self._client, params, {
        NextToken = "--starting-token"
    })
  end,
  subscribe= function(self, params)
    self._client:setMethod("subscribe")
    return self:executor(self._client, params, {
      Protocol = "--protocol",
      TopicArn = "--topic-arn",
      Endpoint = "--notification-endpoint"
    })
  end,

  createTopic = function(self, params)
    self._client:setMethod("create-topic")
    return self:executor(self._client, params, {
       Name = "--name"
    })
  end,
  deleteTopic = function(self, params)
    self._client:setMethod("delete-topic")
    return self:executor(self._client, params, {
       TopicArn = "--topic-arn"
    })
  end
}
