require "kat/version"
require "kat/sql_processor"
require "kat/database"
require "thor"
require "logger"

module Kat

  def self.logger
    @logger
  end
  def self.logger=(logger)
    @logger = logger
  end

  class CLI < Thor
    class_option :log_level, :default => "WARN"

    desc "test FILENAME", "Attempt to read and process FILENAME (an SQL file)"
    def read(filename)
      Kat::logger = Logger.new(STDOUT, level: options[:log_level])
      abort "File does not exist: #{filename}" if !File.file?(filename)
      database = File.open(filename, "r") { |f| Kat.process_sql(f, Kat::Database.new(filename)) }
      puts "#{database.tables.count} tables found, #{database.constraints.count} constraints found"
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
