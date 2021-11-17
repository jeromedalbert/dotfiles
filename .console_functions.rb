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

def explain(query)
  puts ActiveRecord::Base.connection.execute("explain analyze #{query.to_sql}").values
end

def stack_trace
  caller.reject { _1['gems/'] }
end

alias :stt :stack_trace
alias :stack :stack_trace
alias :stacktrace :stack_trace
