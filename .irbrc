require 'irb/completion'
require 'irb/ext/save-history'
require 'awesome_print'

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:AUTO_INDENT] = true

AwesomePrint.irb!

def rr
  reload!
end

def m(object)
  object.methods - Object.methods
end

def lm(object)
  object.methods - object.class.superclass.instance_methods
end

def sk
  Sidekiq.redis { |conn| conn.flushdb }
end

def cpp(input)
  IO.popen('pbcopy', 'w') { |pipe| pipe.puts(input) }
  input
end
