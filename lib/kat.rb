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

    desc "describe FILENAME", "Process FILENAME (an SQL file) and output database structure"
    def describe(filename)
      Kat::logger = Logger.new(STDOUT, level: options[:log_level])
      abort "File does not exist: #{filename}" if !File.file?(filename)
      database = File.open(filename, "r") { |f| Kat.process_sql(f, Kat::Database.new(filename)) }
      database.each_table do |table|
        puts "#{table.name} table"
        if table.constraining_constraints.count > 0
          (table.constraining_constraints.map {|c| c.pk_field.name}).uniq.sort.each do |pk_field_name|
            puts "  Constrained on #{pk_field_name} by:"
            table.constraining_constraints.each do |constraint|
              puts "    - #{constraint.fk_field.table.name}(#{constraint.fk_field.name})" if constraint.pk_field.name == pk_field_name
            end
          end
        end
        if table.constraints.count > 0
          (table.constraints.map {|c| c.fk_field.name}).uniq.sort.each do |fk_field_name|
            puts "  Constrains from foreign key #{fk_field_name}:"
            table.constraints.each do |constraint|
              puts "    - #{constraint.pk_field.table.name}(#{constraint.pk_field.name})" if constraint.fk_field.name == fk_field_name
            end
          end
        end
      end
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
