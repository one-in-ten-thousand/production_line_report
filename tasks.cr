# See `LuckyEnv#task?`
ENV["LUCKY_TASK"] = "true"

require "./src/config/database"
require "avram/src/lucky/tasks/gen/model"
require "lucky_task"
require "./tasks/**"

LuckyTask::Runner.run
