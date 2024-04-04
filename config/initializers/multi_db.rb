# Ensure that the benchmarking path is read from the reading database.
# We will force write operations to the writing database by patching the
# `transaction` method in the adapter.
module EnhancedSQLite3
  module Middleware
    class DatabaseSelector
      class Resolver < ActiveRecord::Middleware::DatabaseSelector::Resolver
        def reading_request?(request)
          request.get? || request.head? || request.path.start_with?("/benchmarking")
        end
      end
    end
  end
end

# Patch the `activerecord-enhancedsqlite3-adapter` gem's Adapter class
# to ensure that write operations are sent to the writing database.
module EnhancedSQLite3
  module Adapter
    def transaction(...)
      ActiveRecord::Base.connected_to(role: ActiveRecord.writing_role, prevent_writes: false) do
        super(...)
      end
    end
  end
end

# Multi-db Configuration
#
# This file is used for configuration settings related to multiple databases.
#
# Enable Database Selector
#
# Inserts middleware to perform automatic connection switching.
# The `database_selector` hash is used to pass options to the DatabaseSelector
# middleware. The `delay` is used to determine how long to wait after a write
# to send a subsequent read to the primary.
#
# The `database_resolver` class is used by the middleware to determine which
# database is appropriate to use based on the time delay.
#
# The `database_resolver_context` class is used by the middleware to set
# timestamps for the last write to the primary. The resolver uses the context
# class timestamps to determine how long to wait before reading from the
# replica.
#
# By default Rails will store a last write timestamp in the session. The
# DatabaseSelector middleware is designed as such you can define your own
# strategy for connection switching and pass that into the middleware through
# these configuration options.

Rails.application.configure do
  # Since we aren't actually using separate databases, only separate connections,
  # we don't need to ensure that requests "read your own writes" with a `delay`
  config.active_record.database_selector = { delay: 0 }
  # Use our custom resolver to ensure that benchmarking requests are sent to the reading database connection
  config.active_record.database_resolver = EnhancedSQLite3::Middleware::DatabaseSelector::Resolver
  # Keep Rails' default resolver context
  config.active_record.database_resolver_context = ActiveRecord::Middleware::DatabaseSelector::Resolver::Session
end

# Enable Shard Selector
#
# Inserts middleware to perform automatic shard swapping. The `shard_selector` hash
# can be used to pass options to the `ShardSelector` middleware. The `lock` option is
# used to determine whether shard swapping should be prohibited for the request.
#
# The `shard_resolver` option is used by the middleware to determine which shard
# to switch to. The application must provide a mechanism for finding the shard name
# in a proc. See guides for an example.
#
# Rails.application.configure do
#   config.active_record.shard_selector = { lock: true }
#   config.active_record.shard_resolver = ->(request) { Tenant.find_by!(host: request.host).shard }
# end
