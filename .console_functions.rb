alias q exit

def rr
  reload!
end

def m(object)
  object.methods - Object.methods
end

def lm(object)
  object.methods - object.class.superclass.instance_methods
end

def skflush
  Sidekiq.redis { |conn| conn.flushdb }
end

alias :sflush :skflush

def cpp(input)
  IO.popen('pbcopy', 'w') { |pipe| pipe.puts(input) }
  input
end

def bm(&block)
  Benchmark.realtime(&block)
end

def analyze(query)
  query = query.to_sql if !query.is_a?(String)

  puts ActiveRecord::Base.connection.execute("explain analyze #{query}").values
end
alias :explain :analyze

def callerc
  caller.reject { _1['gems/'] }
end

def config
  Rails.application.config
end

require File.expand_path('~/.local')
