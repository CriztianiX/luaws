local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
local Luaws_Service_S3 = class.Luaws_Service_S3.extends(BaseSkel) {
  service = "s3api"
}
Luaws_Service_S3:parse_operations({
  "createBucket", "deleteBucket", "deleteObject", "listBuckets",
  "putObject"
})
return Luaws_Service_S3
