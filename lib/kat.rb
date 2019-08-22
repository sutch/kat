require "kat/version"
require "kat/sql_processor"
require "kat/database"
require "thor"

module Kat

  class CLI < Thor
    desc "test FILENAME", "Attempt to read and process FILENAME (an SQL file)"
    def read(filename)
      abort "File does not exist: #{filename}" if !File.file?(filename)
      database = File.open(filename, "r") { |f| Kat.process_sql(f, Kat::Database.new(filename)) }
      puts "#{database.tables.count} tables found, #{database.constraints.count} constraints found"
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
