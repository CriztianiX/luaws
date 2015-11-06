local class = require 'middleclass'
local Luaws_Service = require 'luaws.service'
local Luaws_Services_SQS = class('Luaws_Services_SQS', Luaws_Service)
Luaws_Services_SQS.static.service_type = "json"
Luaws_Services_SQS.static.service = "sqs"
Luaws_Services_SQS.static.methods = {
  "createQueue",
  "deleteQueue",
  "deleteMessage",
  "listQueues",
  "receiveMessage",
  "sendMessage"
}
return Luaws_Services_SQS
