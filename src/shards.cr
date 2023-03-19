require "lucky_env"

LuckyEnv.load(".env")

require "pg"
require "avram"

require "baked_file_system_mounter"
require "graphql"

require "kemal"
require "kemal-basic-auth"
