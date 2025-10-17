begin
  require 'amazing_print'
  AmazingPrint.pry!
  AmazingPrint.defaults = { hash_format: :rocket, colors: :values_only }
rescue LoadError
end

Pry.config.pager = false if ENV['VIM']

if defined?(PryByebug)
  Pry.commands.alias_command 'con', 'continue'
  # Pry.commands.alias_command 'c', 'continue'
  # Pry.commands.alias_command 's', 'step'
  # Pry.commands.alias_command 'n', 'next'
  # Pry.commands.alias_command 'f', 'finish'
end

require_relative '.console_functions'
