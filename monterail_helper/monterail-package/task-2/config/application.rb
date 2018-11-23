require "yaml"

APP_ENV = ENV["APP_ENV"] || "development"
db_config_path = "./config/database.yml"
DB_CONFIG = YAML::load(File.open(db_config_path))[APP_ENV]
DB_CONFIG_ADMIN = DB_CONFIG.merge({ "database" => "postgres", "schema_search_path" => "public" })
