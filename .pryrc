begin
  require 'awesome_print'
  AwesomePrint.pry!
rescue LoadError
end

Pry.config.pager = false if ENV['VIM']

require_relative '.console_functions'
