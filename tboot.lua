local Luaws = require "luaws.luaws"
local luaws = Luaws.new({
  access_key = os.getenv("AWS_ACCESS_KEY"),
  access_secret = os.getenv("AWS_ACCESS_SECRET"),
  region = os.getenv("AWS_REGION")
})

local result = luaws:S3():putObject({
  Key = "LICENSE",
  Bucket = os.getenv("AWS_BUCKET") .. "LICENSE",
})

os.exit()
local result = luaws:SNS():listTopics()
local result = luaws:SNS():listTopics({
  NextToken = "TOKEN"
})
