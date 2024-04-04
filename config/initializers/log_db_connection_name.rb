# Patch the `activerecord-enhancedsqlite3-adapter` gem's Adapter class
# to log the database connection name when logging SQL queries.
module EnhancedSQLite3
  module Adapter
    def log(...)
      db_connection_name = ActiveRecord::Base.connection_db_config.name
      if Rails.logger.formatter.current_tags.include? db_connection_name
        super
      else
        Rails.logger.tagged(db_connection_name) { super }
      end
    end
  end
end

# Add a backtrace silencer to prevent all SQL logging to report as originating from this file.
Rails.backtrace_cleaner.add_silencer { |line| line =~ Regexp.new(File.basename(__FILE__)) }
