local class = require("luaws.class")
local BaseCmdService = require("luaws.services.base_cmd")
return class.Luaws_S3.extends(BaseCmdService) {
  service = "s3",
  putObject = function(self, params)
    self._client:setMethod("cp")
    return self:executor(params)
  end
}
