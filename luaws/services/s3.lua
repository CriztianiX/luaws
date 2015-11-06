local class = require 'middleclass'
local Luaws_Service = require 'luaws.service'
local Luaws_Services_S3 = class('Luaws_Services_S3', Luaws_Service)
Luaws_Services_S3.static.service_type = "json"
Luaws_Services_S3.static.service = "s3api"
Luaws_Services_S3.static.methods = {
  "createBucket", "deleteBucket", "deleteObject", "listBuckets",
  "putObject"
}
return Luaws_Services_S3
