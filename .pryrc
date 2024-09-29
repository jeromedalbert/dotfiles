begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
end

Pry.config.pager = false if ENV['VIM']

# if defined?(PryByebug)
  # Pry.commands.alias_command 'c', 'continue'
  # Pry.commands.alias_command 's', 'step'
  # Pry.commands.alias_command 'n', 'next'
  # Pry.commands.alias_command 'f', 'finish'

  # def c
  #   continue if !defined?(c)
  # end
# end

require_relative '.console_functions'
