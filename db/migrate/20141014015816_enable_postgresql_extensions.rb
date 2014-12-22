class EnablePostgresqlExtensions < ActiveRecord::Migration
  def change
    enable_extension "uuid-ossp"
    enable_extension "plpgsql"
    enable_extension "pg_trgm"
    enable_extension "fuzzystrmatch"
    enable_extension "unaccent"
  end
end
