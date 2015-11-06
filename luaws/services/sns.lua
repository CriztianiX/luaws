local class = require 'middleclass'
local Luaws_Service = require 'luaws.service'
local Luaws_Services_SNS = class('Luaws_Services_SNS', Luaws_Service)
Luaws_Services_SNS.static.service_type = "json"
Luaws_Services_SNS.static.service = "sns"
Luaws_Services_SNS.static.methods = {
  "createPlatformEndpoint", "listTopics", "subscribe",
  "createTopic", "deleteTopic"
}
return Luaws_Services_SNS
