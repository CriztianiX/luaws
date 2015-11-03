local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local Luaws_Service_SQS = class.Luaws_Service_SQS.extends(BaseSkel)({
  service = "sqs"
})

Luaws_Service_SQS:parse_operations({
  "createQueue",
  "deleteQueue",
  "deleteMessage",
  "listQueues",
  "receiveMessage",
  "sendMessage"
})

return Luaws_Service_SQS
