# Represent an SQL database schema

module Kat

  class Field

    attr_reader :name  # string
    attr_reader :data_type  # string
    attr_reader :table  # Table object

    attr_accessor :can_contain_null_values  # boolean
    attr_accessor :default_value
    attr_accessor :character_set

    def initialize(name:, data_type:, table:)
      @name = name
      @data_type = data_type
      @table = table
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

    attr_reader :name  #string
    attr_reader :fields  # field names (TODO: change to Field objects)
    attr_reader :unique
    attr_reader :table   # Table object

    def initialize(name:, fields:, unique:, table:)
      @name = name
      @fields = fields
      @unique = unique
      @table = table
    end

    def to_s
      @name
    end

    def inspect
      "Key(name: #{name})"
    end
  end


  class Constraint

    attr_reader :name
    attr_reader :fk_field  # Field object of foreign key in the child table
    attr_reader :pk_field  # Field object of primary key in the parent table
    attr_reader :table  # Table object

    def initialize(name:, foreign_key:, parent_table:, field:, table:)
      @name = name
      @fk_field = table.get_field_by_name(foreign_key)
      @pk_field = table.database.get_table_by_name(parent_table).get_field_by_name(field)
      @table = table
    end

    def to_s
      @name
    end

    def inspect
      "Constraint(name: #{name}, fk: #{fk_field.table.name}(#{fk_field.name})), pk: #{pk_field.table.name}(#{pk_field.name})"
    end
  end


  class Table

    attr_reader :name  # string
    attr_reader :database  # Database object
    attr_reader :constraints  # array of Constraint objects
    attr_accessor :constraining_constraints  # array of Constraint objects

    attr_reader :keys
    attr_accessor :primary_key

    def initialize(name:, database:)
      @name = name
      @database = database
      @fields = {}
      @primary_key = nil
      @keys = {}
      @constraints = []
      @constraining_constraints = []
    end

    def to_s
      @name
    end

    def inspect
      "Table(name: #{name})"
    end

    def add_field(**args)
      abort "Adding duplicate field name: #{args[:name]} to table: #{@name}" if @fields.keys.include?(args[:name])
      @fields[args[:name]] = field = Field.new({table: self}.merge(args))
      field
    end

    def get_field_by_name(name)
      @fields[name]
    end

    def each_field
      @fields.each {|name, field| yield field}
    end

    def add_key(**args)
      abort "Adding duplicate key name: #{args[:name]} to table: #{name}" if @keys.keys.include?(args[:name])
      @keys[args[:name]] = key = Key.new({table: self}.merge(args))
      key
    end

    def get_key_by_name(name)
      @keys[name]
    end

    def add_constraint(**args)
      if @constraints.find {|c| c.name == args[:name]}
        abort "Adding duplicate constraint name: #{args[:name]} to table: #{@name}"
      end
      @constraints << constraint = Constraint.new({table: self}.merge(args))
      Kat::logger.info("Constraint added to table #{@name}: #{constraint.inspect}")
      constraint.pk_field.table.add_constraining_constraint(constraint)
      @database.add_constraint(constraint)
      constraint
    end

    def add_constraining_constraint(constraint)
      if @constraining_constraints.find {|c| c.name == constraint.name}
        abort "Adding duplicate contraining constraint name: #{args[:name]} to table: #{@name}"
      end
      @constraining_constraints << constraint
      Kat::logger.info("Constraining constraint added to table #{@name}: #{constraint.inspect}")
      constraint
    end
  end


  class Database

    attr_reader :name  # string
    attr_reader :constraints  # array of Constraint objects

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
      @tables.each {|name, table| yield table}
    end

    def add_constraint(constraint)
      constraints << constraint
    end
  end

end
