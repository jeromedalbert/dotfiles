require 'irb/completion'
require 'irb/ext/save-history'

begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError
end

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:AUTO_INDENT] = true

require '~/.console_functions'
