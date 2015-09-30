local Luaws = require "luaws.luaws"
local luaws = Luaws.new({
  access_key = "A",
  access_secret = "B",
  region = "us-east-1"
})

local result = luaws:SNS():listTopics()
print(result)

local result = luaws:SNS():listTopics({
  NextToken = "TOKEN"
})
