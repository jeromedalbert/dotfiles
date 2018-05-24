require 'awesome_print'

AwesomePrint.pry!

def rr
  reload!
end

def m(object)
  object.methods - Object.methods
end

def lm(object)
  object.methods - object.class.superclass.instance_methods
end

def sc
  Sidekiq.redis { |conn| conn.flushdb }
end

def sk
  sc
end
