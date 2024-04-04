module Extralite
  class Database
    alias_method :original_execute, :execute
    alias_method :execute, :query
    alias_method :execute_batch2, :query
    alias_method :readonly?, :read_only?
    alias_method :prepare, :prepare_array

    def transaction(mode = :immediate)
      mode = @default_transaction_mode if mode.nil?
      execute "begin #{mode} transaction"

      if block_given?
        abort = false
        begin
          yield self
        rescue
          abort = true
          raise
        ensure
          abort ? rollback : commit
        end
      end

      true
    end

    def commit = execute("commit transaction")
    def rollback = execute("rollback transaction")
    def encoding = "UTF-8"
    def busy_timeout(timeout) = self.busy_timeout=(timeout)
    def foreign_keys=(value)
      pragma(foreign_keys: value)
    end
    def journal_mode=(value)
      pragma(journal_mode: value)
    end
    def synchronous=(value)
      pragma(synchronous: value)
    end
    def mmap_size=(value)
      pragma(mmap_size: value)
    end
    def journal_size_limit=(value)
      pragma(journal_size_limit: value)
    end
    def cache_size=(value)
      pragma(cache_size: value)
    end
  end

  class Query
    alias_method :original_to_a, :to_a
    alias_method :reset!, :reset
    def bind_params(bind_vars) = bind(*bind_vars)

    alias_method :original_columns, :columns
    def columns = original_columns.map(&:to_s)
  end
end

module EnhancedSQLite
  module Adapter
    def self.prepended(base)
      base.singleton_class.prepend(ClassMethods)
    end
    module ClassMethods
      def new_client(config)
        ::Extralite::Database.new(config[:database].to_s, config)
      rescue Errno::ENOENT => error
        if error.message.include?("No such file or directory")
          raise ActiveRecord::NoDatabaseError
        else
          raise
        end
      end
    end
  end
end

ActiveSupport.on_load(:active_record_sqlite3adapter) do
  prepend EnhancedSQLite::Adapter
end