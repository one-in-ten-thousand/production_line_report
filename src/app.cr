require "./shards"

# Load the asset manifest
Lucky::AssetHelpers.load_manifest "public/mix-manifest.json"

require "../config/server"
require "./app_database"
require "../config/**"

# models
require "./models/base_model"
require "./models/mixins/**"
require "./models/**"

# queries
require "./queries/mixins/**"
require "./queries/**"

# operations
require "./operations/mixins/**"
require "./operations/**"

# serializers
require "./serializers/base_serializer"
require "./serializers/**"

# emails
require "./emails/base_email"
require "./emails/**"

# actions
require "./actions/mixins/**"
require "./actions/**"

# components
require "./components/base_component"
require "./components/**"

# pages
require "./pages/**"

# migrations
require "../db/migrations/**"

require "./app_server"
