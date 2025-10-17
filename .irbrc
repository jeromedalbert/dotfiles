require 'irb/completion'
begin
  require 'irb/ext/save-history'
rescue LoadError
end

begin
  require 'amazing_print'
  AmazingPrint.irb!
  AmazingPrint.rdbg!
  AmazingPrint.defaults = { hash_format: :rocket, colors: :values_only }
rescue LoadError
end

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_AUTOCOMPLETE] = false

IRB.conf[:COMMAND_ALIASES].merge!(
  con: :continue,
  rr: :reload!
)

require_relative '.console_functions'
