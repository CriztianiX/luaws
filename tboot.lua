require("moon.all")
local Luaws = require "luaws.luaws"
local luaws = Luaws.new({
  access_key = os.getenv("AWS_ACCESS_KEY"),
  access_secret = os.getenv("AWS_ACCESS_SECRET"),
  region = os.getenv("AWS_REGION")
})

local topics = luaws:SNS():listTopics()
p(topics)

local result = luaws:S3():putObject({
  Key = "LICENSE",
  Bucket = os.getenv("AWS_BUCKET") .. "LICENSE",
  ACL = "public-read"
})

local result = luaws:SNS():createTopic({
  Name = "luaws"
})
p(result)

local topic_arn = result.TopicArn
local subscribe = luaws:SNS():subscribe({
  TopicArn = topic_arn,
  Protocol = "application",
  Endpoint = os.getenv("AWS_SNS_ENPOINT_ARN")
})
p(subscribe)

local result = luaws:SNS():deleteTopic({
  TopicArn = topic_arn
})
p(result)

local topics = luaws:SNS():listTopics()
p(topics)
