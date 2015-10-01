local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
return class.Luaws_SWF.extends(BaseSkel) {
  service = "swf",
  pollForDecisionTask = function(self, params)
    self._client:setMethod("poll-for-decision-task")
    return self:executor(self._client, params)
  end
}
