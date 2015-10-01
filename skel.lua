local dkjson = require "dkjson"
local exec = function(cmd)
  print("Skel: " .. cmd)
  local popen = io.popen
  local handle = popen(cmd)
  local result = handle:read("*a")
  handle:close()
  local t = dkjson.decode(result)
  require "moon.all"
  p(t)
  os.exit()
end

local services = {
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

for service, method in pairs(services) do
  for _, value  in ipairs(method) do
    local f = "luaws/services/specs/" .. service .. "_" .. value .. ".json"
    local cmd = "aws " .. service .. " " .. value .. " --generate-cli-skeleton"
    exec(cmd)
  end
end
