module Kat

  # Given SQL and a database (currently Kat::Database) instance,
  # process the SQL and create the database structure
  def self.process_sql(file, database)
    state = :read_next_statement
    table = nil
    file.each_line do |line|
      next if line =~ /^\s*$/  # blank line

      case state
      when :read_next_statement
        next if line =~ /^--/  # comment
        next if line =~ /^SET\s.*;\s*$/  # SET statement
        next if line =~ /^\/\*.*\*\/\s*;\s*$/  # comment
        case line
        when /^\s*CREATE\s+TABLE\s+`([^`]+)`\s+\(\s*$/
          table = database.add_table($1)
          state = :read_table_fields
        when /^\s*ALTER TABLE `([^`]+)`\s*$/
          table = database.get_table_by_name($1)
          state = :alter_table
        else
          abort "Unrecognized SQL statement on line #{file.lineno}: #{line}"
        end

      when :read_table_fields
        case line
        when /^\s*`([^`]+)`\s+([^\s]+)\s+(.*)$/
          field = table.add_field(name: $1, data_type: $2)
          line = $3
          state = :read_field_attributes
          while state == :read_field_attributes
            case line
            when /^\s*$/
              state = :read_table_fields_close_paren
            when /^\s*NOT\s+NULL\s*(.*)$/
              field.can_contain_null_values = false
              line = $1
            when /^\s*DEFAULT\s+('[^']+')\s*(.*)$/
              field.default_value = $1
              line = $2
            when /^\s*DEFAULT\s+("[^"]+")\s*(.*)$/
              field.default_value = $1
              line = $2
            when /^\s*DEFAULT\s+([^\s,]+)\s*(.*)$/
              field.default_value = $1
              line = $2
            when /^\s*CHARACTER\s+SET\s+([^\s,]+)\s+(.*)$/
              field.character_set = $1
              line = $2
            when /^\s*,\s*$/
              state = :read_table_fields
            else
              abort "Unrecognized SQL field attribute on line #{file.lineno}: #{line}"
            end
          end
        end

      when :read_table_fields_close_paren
        if line =~ /^\s*\).*;\s*$/
          state = :read_next_statement
        else
          abort "Unrecognized SQL field termination on line #{file.lineno}: #{line}"
        end

      when :alter_table
        case line
        when /^\s*ADD\s+PRIMARY\s+KEY\s+\((?<fields>[^)]+)\)\s*
            (?<line_terminator>[,;])\s*$/x
          state = :read_next_statement if $~[:line_terminator] == ";"
          table.primary_key = $~[:fields].tr("`", "").split(",")
        when /^\s*ADD\s+(?<unique>UNIQUE\s+)?KEY\s+`(?<name>[^`]+)`\s+
            \((?<fields>[^)]+)\)\s*
            (?<line_terminator>[,;])\s*$/x
          state = :read_next_statement if $~[:line_terminator] == ";"
          table.add_key(name: $~[:name], fields: $~[:fields].tr("`", "").split(","), unique: ($~[:unique] ? true : false))
        when /^\s*ADD\s+CONSTRAINT\s+`(?<name>[^`]+)`\s+
            FOREIGN\s+KEY\s+\(`(?<fk>[^`]+)`\)\s+
            REFERENCES\s+`(?<table>[^`]+)`\s+\(`(?<field>[^`]+)`\)\s*
            (?<line_terminator>[,;])\s*$/x
            # NOTE: does not support constraints containing multiple foreign keys
            # or multiple references
          state = :read_next_statement if $~[:line_terminator] == ";"
          table.add_constraint(name: $~[:name], foreign_key: $~[:fk], parent_table: $~[:table], field: $~[:field])
        else
          abort "Unrecognized SQL alter table command on line #{file.lineno}: #{line}"
        end
      end
    end

    database
  end

end
