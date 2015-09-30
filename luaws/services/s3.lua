local class = require("luaws.class")
local Base = require("luaws.services.base")
return class.Luaws_S3.extends(Base) {
  service = "s3",
  putObject = function(self, params)
    self._client:setMethod("cp")
    return self:executor(self._client, params, {
        Key = { type = "arg",  index = 1 },
        Bucket = { type = "arg", index = 2 }
    })
  end
}
