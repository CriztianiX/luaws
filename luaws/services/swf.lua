local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local Luaws_Service_SWF = class.Luaws_Service_SWF.extends(BaseSkel)({
  service = "swf"
})
Luaws_Service_SWF:parse_operations({
  "listDomains", "pollForDecisionTask"
})

return Luaws_Service_SWF
