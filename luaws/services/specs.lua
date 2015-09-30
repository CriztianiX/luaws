return {
  -- Start SWF spec
  swf = {
    ["poll-for-decision-task"] = {
      domain = { name = "--domain", type = "string" },
      taskList = {
        name = "--task-list",
        type = "structure",
        structure = {
          { name = "name", type = "string" }
        }
      }
    }
  }
  -- End SWF spec
}
