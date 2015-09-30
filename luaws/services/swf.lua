local class = require("luaws.class")
local Base = require("luaws.services.base")
return class.Luaws_SWF.extends(Base) {
  service = "swf",
  pollForDecisionTask = function(self, params)
    self._client:setMethod("poll-for-decision-task")
    return self:executor(self._client, params, {
        domain = "--domain",
        taskList = "--task-list"
    })
  end
}
