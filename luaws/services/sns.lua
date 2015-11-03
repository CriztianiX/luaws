local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local Luaws_Service_SNS = class.Luaws_Service_SNS.extends(BaseSkel)({
  service = "sns"
})
Luaws_Service_SNS:parse_operations({
  "createPlatformEndpoint", "listTopics", "subscribe",
  "createTopic", "deleteTopic"
})
return Luaws_Service_SNS
