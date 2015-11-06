local class = require 'middleclass'
local Luaws_Service = require 'luaws.service'
local Luaws_Services_SWF = class('Luaws_Services_SWF', Luaws_Service)
Luaws_Services_SWF.static.service_type = "json"
Luaws_Services_SWF.static.service = "swf"
Luaws_Services_SWF.static.methods = {
  "listDomains",
  "pollForDecisionTask"
}
return Luaws_Services_SWF
