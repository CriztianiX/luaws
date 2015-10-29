local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local Luaws_Service_SQS = class.Luaws_Service_SQS.extends(BaseSkel)({
  service = "sqs"
})
local operations = {
  createQueue = "create-queue",
  deleteQueue = "delete-queue",
  deleteMessage = "delete-message",
  listQueues = "list-queues",
  receiveMessage = "receive-message",
  sendMessage = "send-message"
}

for op, arg in pairs(operations) do
  Luaws_Service_SQS[op] = function(self, params)
    self._client:setMethod(arg)
    return self:executor(params)
  end
end

return Luaws_Service_SQS
