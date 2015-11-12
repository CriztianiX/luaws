local class = require 'middleclass'
local Luaws_Service = require 'luaws.service'
local Luaws_Services_Cloudwatch = class('Luaws_Services_Cloudwatch', Luaws_Service)
Luaws_Services_Cloudwatch.static.service_type = "json"
Luaws_Services_Cloudwatch.static.service = "cloudwatch"
Luaws_Services_Cloudwatch.static.methods = {
  "listMetrics", "getMetricStatistics"
}
return Luaws_Services_Cloudwatch
