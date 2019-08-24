# Represent an SQL database schema

module Kat

  class Field

    attr_reader :name
    attr_reader :data_type
    attr_reader :table
    attr_accessor :can_contain_null_values
    attr_accessor :default_value
    attr_accessor :character_set

    def initialize(**args)
      @table = args[:table]
      @name = args[:name]
      @data_type = args[:data_type]
      @can_contain_null_values = true
      @default_value = nil
      @character_set = nil
    end

    def to_s
      @name
    end

    def inspect
      "Field(name: #{name})"
    end
  end


  class Key

    attr_reader :table
    attr_reader :name
    attr_reader :fields  # field names (TODO: change to actual fields)
    attr_reader :unique

    def initialize(table:, name:, fields:, unique:)
      @table = table
      @name = name
      @fields = fields
      @unique = unique
    end

    def to_s
      @name
    end

    def inspect
      "Key(name: #{name})"
    end
  end

  class Constraint

    attr_reader :table
    attr_reader :name
    attr_reader :foreign_key
    attr_reader :field

    def initialize(**args)
      @table = args[:table]
      @name = args[:name]
      @foreign_key = table.get_field_by_name(args[:foreign_key])
      @field = table.database.get_table_by_name(args[:parent_table]).get_field_by_name(args[:field])
    end

    def to_s
      @name
    end

    def inspect
      "Constraint(name: #{name}, fk: #{table.name}(#{foreign_key.name}))"
    end
  end

  class Table

    attr_reader :database
    attr_reader :name
    attr_accessor :primary_key
    attr_accessor :keys
    attr_accessor :constraints
    attr_accessor :constraining_constraints

    def initialize(**args)
      @database = args[:database]
      @name = args[:name]
      @fields = {}
      @primary_key = nil
      @keys = {}
      @constraints = {}
      @constraining_constraints = {}
    end

    def to_s
      @name
    end

    def inspect
      "Table(name: #{name})"
    end

    def add_field(**args)
      abort "Adding duplicate field name: #{args[:name]} to table: #{name}" if @fields.keys.include?(args[:name])
      @fields[args[:name]] = field = Field.new({table: self}.merge(args))
      field
    end

    def get_field_by_name(name)
      @fields[name]
    end

    def each_field
      @fields.each {|n,f| yield f}
    end

    def add_key(**args)
      abort "Adding duplicate key name: #{args[:name]} to table: #{name}" if @keys.keys.include?(args[:name])
      @keys[args[:name]] = key = Key.new({table: self}.merge(args))
      key
    end

    def get_key_by_name(name)
      @keys[name]
    end

    def each_key
      @keys.each {|n,k| yield k}
    end

    def add_constraint(**args)
      abort "Adding duplicate constraint name: #{args[:name]} to table: #{name}" if @constraints.keys.include?(args[:name])
      @constraints[args[:name]] = constraint = Constraint.new({table: self}.merge(args))
      Kat::logger.info("Constraint added to table #{args[:name]}: #{constraint.inspect}")
      abort "Adding duplicate contraining constraint name: #{args[:name]} to table: #{name}" if constraint.field.table.constraining_constraints.keys.include?(args[:name])
      constraint.field.table.constraining_constraints[args[:name]] = constraint
      Kat::logger.info("Constraining constraint added to table #{constraint.field.table.constraining_constraints[args[:name]]}")
      constraint.field.table.database.add_constraint(constraint)
      constraint
    end

    def get_constraint_by_name(name)
      @constraints[name]
    end

    def each_constraint
      @constraints.each {|n,c| yield c}
    end

    def each_constraining_constraint
      @constraining_constraints.each {|n,c| yield c}
    end
  end

  class Database

    attr_reader :name
    attr_reader :constraints

    def initialize(name)
      @name = name
      @tables = {}
      @constraints = []
    end

    def to_s
      @name
    end

    def inspect
      "Database(name: #{name})"
    end

    def add_table(name)
      abort "Adding duplicate table name: #{name}" if @tables.keys.include?(name)
      @tables[name] = table = Table.new(name: name, database: self)
      Kat::logger.info("Created table #{name}")
      table
    end

    def get_table_by_name(name)
      @tables[name]
    end

    def tables
      @tables.values
    end

    def each_table
      @tables.each {|n,t| yield t}
    end

    def add_constraint(constraint)
      constraints << constraint
    end
  end

end
