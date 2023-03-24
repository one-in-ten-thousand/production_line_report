# Load .env file before any other config or app code
require "lucky_env"
LuckyEnv.load(".env")

# Require your shards here
require "lucky"
require "avram/lucky"

# email library
require "carbon"

require "baked_file_system_mounter"
require "graphql"

require "authentic"
require "jwt"

# require "kemal"
# require "kemal-basic-auth"
