local class = require("luaws.class")
local BaseSkel = require("luaws.services.base_skel")
return class.Luaws_S3.extends(BaseSkel) {
  service = "s3api",
  createBucket = function(self, params)
    self._client:setMethod("create-bucket")
    return self:executor(params)
  end,
  deleteBucket = function(self, params)
    self._client:setMethod("delete-bucket")
    return self:executor(params)
  end,
  deleteObject = function(self, params)
    self._client:setMethod("delete-object")
    return self:executor(params)
  end,
  listBuckets = function(self, params)
    self._client:setMethod("list-buckets")
    return self:executor(params)
  end,
  putObject = function(self, params)
    self._client:setMethod("put-object")
    return self:executor(params)
  end
}
