local class = require 'middleclass'
local Luaws_Services_S3 = require 'luaws.services.s3'
local Luaws_Services_SNS = require 'luaws.services.sns'
local Luaws_Services_SQS = require 'luaws.services.sqs'
local Luaws_Services_SWF = require 'luaws.services.swf'
local Luaws_Services_Factory = class('Luaws_Services_Factory')

function Luaws_Services_Factory.static.create(service, core)
  local services = {
    S3 = function()
      return Luaws_Services_S3:new()
    end,
    SNS = function()
      return Luaws_Services_SNS:new()
    end,
    SQS = function()
      return Luaws_Services_SQS:new()
    end,
    SWF = function()
      return Luaws_Services_SWF:new()
    end
  }

  local s = services[service]()
  s:setCore(core)
  return s
end

return Luaws_Services_Factory
