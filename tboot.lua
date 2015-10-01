require("moon.all")
describe("Luaws, a bridge to aws-cli", function()
  local luaws, topic_arn
  setup(function()
    luaws = require("luaws.luaws").new({
      access_key = os.getenv("AWS_ACCESS_KEY"),
      access_secret = os.getenv("AWS_ACCESS_SECRET"),
      region = os.getenv("AWS_REGION")
    })
  end)
  --
  -- SNS
  describe("-> SNS ->", function()
    it("should create a topic", function()
      local topic = luaws:SNS():createTopic({
        Name = "luaws"
      })
      topic_arn = topic.TopicArn
      assert.are_not.equals(nil, topic.TopicArn)
    end)
    it("should subcribe an endpoint to topic", function()
      local subscribe = luaws:SNS():subscribe({
        TopicArn = topic_arn,
        Protocol = "application",
        Endpoint = os.getenv("AWS_SNS_ENPOINT_ARN")
      })
      assert.are_not.equals(nil, subscribe.SubscriptionArn)
    end)
    it("should delete a topic", function()
      local result = luaws:SNS():deleteTopic({
        TopicArn = topic_arn
      })
      assert.are.equals(nil, result)
    end)
    it("should list topics", function()
      local topics = luaws:SNS():listTopics()
      assert.are_not.equals(nil, topics.Topics)
    end)
  end)
  --
  -- S3
  describe("-> S3 ->", function()
    it("should create a bucket", function()
      local bucket = luaws:S3():createBucket({
        Bucket = os.getenv("AWS_BUCKET"),
        ACL = "public-read"
      })
      assert.same({
        Location = "/luaws"
      }, bucket)
    end)
    it("should put an object", function()
      local object = luaws:S3():putObject({
        Key = "LICENSE",
        Bucket = os.getenv("AWS_BUCKET"),
        ACL = "public-read"
      })
      assert.are_not.equals(nil, object.ETag)
    end)
    it("should delete an object", function()
      local object = luaws:S3():deleteObject({
        Bucket = os.getenv("AWS_BUCKET"),
        Key = "LICENSE"
      })
      assert.equals(nil, object)
    end)
    it("should delete a bucket", function()
      local object = luaws:S3():deleteBucket({
        Bucket = os.getenv("AWS_BUCKET")
      })

      assert.equals(nil, object)
    end)
    it("should list buckets", function()
      local buckets = luaws:S3():listBuckets()
      assert.are_not.equals(nil, buckets.Buckets)
    end)
  end)
  --
  --
end)
