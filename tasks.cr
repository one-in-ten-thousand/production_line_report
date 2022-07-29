# See `LuckyEnv#task?`
ENV["LUCKY_TASK"] = "true"

require "./src/config/database"
require "lucky_task"
require "./tasks/**"
require "./db/migrations/**"

LuckyTask::Runner.run
