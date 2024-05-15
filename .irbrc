require 'irb/completion'
begin
  require 'irb/ext/save-history'
rescue LoadError
end

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
end

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_AUTOCOMPLETE] = false

require_relative '.console_functions'
