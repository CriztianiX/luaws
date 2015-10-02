local dkjson = require "luaws.deps.dkjson"
local exec = function(cmd)
  print("Skel: " .. cmd)
  local popen = io.popen
  local handle = popen(cmd)
  local result = handle:read("*a")
  handle:close()
  local t = dkjson.decode(result)
  --require "moon.all"
  --p(t)
  --os.exit()
end

local services = {
  s3api = {
    "abort-multipart-upload", "complete-multipart-upload", "copy-object",
    "create-bucket", "create-multipart-upload", "delete-bucket",
    "delete-bucket-cors", "delete-bucket-lifecycle", "delete-bucket-policy",
    "delete-bucket-replication","delete-bucket-tagging", "delete-bucket-website",
    "delete-object","delete-objects","get-bucket-acl","get-bucket-cors",
    "get-bucket-lifecycle","get-bucket-lifecycle-configuration",
    "get-bucket-location","get-bucket-logging","get-bucket-notification",
    "get-bucket-notification-configuration","get-bucket-policy",
    "get-bucket-replication","get-bucket-request-payment","get-bucket-tagging",
    "get-bucket-versioning","get-bucket-website","get-object","get-object-acl",
    "get-object-torrent","head-bucket","head-object","list-buckets",
    "list-multipart-uploads","list-object-versions","list-objects",
    "list-parts","put-bucket-acl","put-bucket-cors","put-bucket-lifecycle",
    "put-bucket-lifecycle-configuration","put-bucket-logging",
    "put-bucket-notification","put-bucket-notification-configuration",
    "put-bucket-policy","put-bucket-replication","put-bucket-request-payment",
    "put-bucket-tagging","put-bucket-versioning","put-bucket-website","put-object",
    "put-object-acl","restore-object","upload-part","upload-part-copy","wait"
  },
  sns = {
    "add-permission", "confirm-subscription", "create-platform-application",
    "create-platform-endpoint", "create-topic", "delete-endpoint", "delete-platform-application",
    "delete-topic", "get-endpoint-attributes","get-platform-application-attributes",
    "get-subscription-attributes","get-topic-attributes","list-endpoints-by-platform-application",
    "list-platform-applications","list-subscriptions","list-subscriptions-by-topic",
    "list-topics","publish","remove-permission","set-endpoint-attributes",
    "set-platform-application-attributes","set-subscription-attributes","set-topic-attributes",
    "subscribe","unsubscribe"
  },
  sqs = {
    "add-permission",
    "change-message-visibility","change-message-visibility-batch","create-queue",
    "delete-message","delete-message-batch","delete-queue","get-queue-attributes",
    "get-queue-url","list-dead-letter-source-queues","list-queues","purge-queue",
    "receive-message","remove-permission","send-message","send-message-batch",
    "set-queue-attributes"
  },
  swf = {
    "count-closed-workflow-executions", "count-open-workflow-executions", "count-pending-activity-tasks",
    "count-pending-decision-tasks", "deprecate-activity-type", "deprecate-domain","deprecate-workflow-type",
    "describe-activity-type", "describe-domain", "describe-workflow-execution", "describe-workflow-type",
    "get-workflow-execution-history", "list-activity-types", "list-closed-workflow-executions",
    "list-domains", "list-open-workflow-executions", "list-workflow-types","poll-for-activity-task",
    "poll-for-decision-task","record-activity-task-heartbeat","register-activity-type",
    "register-domain","register-workflow-type","request-cancel-workflow-execution",
    "respond-activity-task-canceled","respond-activity-task-completed","respond-activity-task-failed",
    "respond-decision-task-completed","signal-workflow-execution","start-workflow-execution",
    "terminate-workflow-execution"
  }
}

local r = {}
if arg[1] then
  local s = arg[1]
  if not services[s] then
    error("Unknow service: " .. s)
  end

  r[s] = services[s]
else
  r = services
end

for service, method in pairs(r) do
  for _, value  in ipairs(method) do
    local f = "luaws/services/specs/" .. service .. "_" .. value .. ".json"
    local cmd = "aws " .. service .. " " .. value .. " --generate-cli-skeleton > " .. f
    exec(cmd)
  end
end
