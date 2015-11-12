describe("Luaws, a bridge to aws-cli", function()
  local messages, message_id, queue_url, luaws, topic_arn
  setup(function()
    luaws = require("luaws.luaws").new({
      access_key = os.getenv("AWS_ACCESS_KEY"),
      access_secret = os.getenv("AWS_ACCESS_SECRET"),
      region = os.getenv("AWS_REGION")
    })
  end)

  describe("-> #base", function()
    it("should view structure", function()
      local queue = luaws:SQS():getMethodStructure("createQueue")
      assert.are.same({
        QueueName = "",
        Attributes = {
          KeyName = ""
        }
      }, queue)
    end)
  end)
  --
  -- cloudwatch
  describe("-> SQS -> #cloudwatch", function()
    it("should show method structure in list metrics", function()
      local cloudwatch = luaws:CloudWatch():getMethodStructure("listMetrics")
      assert.are.same({
        Dimensions = {
          {
            Name = '',
            Value = ''
          }
        },
        MetricName = '',
        Namespace = '',
        NextToken = ''
      }, cloudwatch)
    end)
    it("should get list metrics", function()
      local cloudwatch = luaws:CloudWatch():listMetrics({
        Namespace = "AWS/SNS",
        MetricName = "NumberOfNotificationsDelivered"
      })
      assert(cloudwatch.Metrics)
    end)
  end)
  --
  -- SQS
  describe("-> SQS -> #sqs", function()
    it("should create a new queue", function()
      local queue = luaws:SQS():createQueue({
        QueueName = os.getenv("AWS_QUEUE")
      })
      assert.are_not.equals("table", queue.QueueUrl)
      queue_url = queue.QueueUrl
    end)
    it("should returns a list of your queues", function()
      local queues = luaws:SQS():listQueues()
      assert.are.equals("table", type(queues))
    end)
    it("Delivers a message to the specified queue", function()
      local message = luaws:SQS():sendMessage({
        MessageBody = "A simple test SQS",
        QueueUrl = queue_url
      })

      assert(message.MessageId)
      message_id = message.MessageId
    end)
    it("Retrieves one or more messages", function()
      local rmessages = luaws:SQS():receiveMessage({
        QueueUrl = queue_url
      })
      assert(rmessages.Messages)
      messages = rmessages.Messages
    end)
    it("Deletes the specified message from the specified queue.", function()
      for _,m in ipairs(messages) do
        local res = luaws:SQS():deleteMessage({
          QueueUrl = queue_url,
          ReceiptHandle = m.ReceiptHandle
        })
        assert.is.equal(nil, res)
      end
    end)
    it("should delete a queue", function()
      local queue = luaws:SQS():deleteQueue({
        QueueUrl = queue_url
      })
      assert.is.equal(nil, queue)
    end)
  end)
  --
  -- SWF
  describe("-> SWF -> #swf", function()
    it("should list domain REGISTERED domains", function()
      local domains = luaws:SWF():listDomains({
        registrationStatus = "REGISTERED"
      })

      assert.are_not.equals(nil, domains.domainInfos)
    end)
  end)

  --
  -- SNS
  describe("-> SNS -> #sns", function()
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
  describe("-> S3 -> #s3", function()
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
