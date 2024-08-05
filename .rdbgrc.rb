begin
  require 'awesome_print'
rescue LoadError
end

module DEBUGGER__
  class Session
    COMMAND_ALIASES = {
      'con' => 'continue',
      'rr' => 'reload!',
      'q' => 'q!'
    }

    alias_method :original_process_command, :process_command

    def process_command(line)
      original_process_command(COMMAND_ALIASES.fetch(line.strip, line))
    end
  end
end

require '/Users/jerome/.console_functions'
