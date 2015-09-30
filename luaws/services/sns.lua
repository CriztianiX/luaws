local class = require("luaws.class")
local Base = require("luaws.services.base")
return class.Luaws_SNS.extends(Base) {
  service = "sns",
  listTopics = function(self, params)
    self._client:setMethod("list-topics")
    return self:executor(self._client, params, {
        NextToken = "--starting-token"
    })
  end
}
