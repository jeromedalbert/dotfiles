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

def bm(&block)
  Benchmark.realtime(&block)
end
