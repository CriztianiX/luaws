local Luaws = require "luaws.luaws"
local luaws = Luaws.new({
  access_key = os.getenv("AWS_ACCESS_KEY"),
  access_secret = os.getenv("AWS_ACCESS_SECRET"),
  region = os.getenv("AWS_REGION")
})

local result = luaws:SNS():listTopics()
print(result)

local result = luaws:SNS():listTopics({
  NextToken = "TOKEN"
})
