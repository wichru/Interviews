require "date"

require "active_record"

require_relative "../models/user"
require_relative "../models/post"
require_relative "../models/comment"

require_relative "../query"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: ":memory:",
)

ActiveRecord::Migration.verbose = false
require_relative "../db/schema"
require_relative "../db/seeds"
