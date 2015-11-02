local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local Luaws_Service_SQS = class.Luaws_Service_SQS.extends(BaseSkel)({
  service = "sqs"
})

Luaws_Service_SQS:parse_operations({
  createQueue = "create-queue",
  deleteQueue = "delete-queue",
  deleteMessage = "delete-message",
  listQueues = "list-queues",
  receiveMessage = "receive-message",
  sendMessage = "send-message"
})

return Luaws_Service_SQS
