import re

def unindent(snip):
  line = snip.buffer[snip.line]
  indent = re.search('[^\s]', line).start()
  indent = max(0, indent - 2)

  snip.buffer[snip.line] = ' ' * indent
  snip.cursor[1] = indent

def camelcase(string):
  return string.title().replace('_', '')
