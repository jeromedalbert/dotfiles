begin
  require 'awesome_print'
rescue LoadError
end

module DEBUGGER__
  class Session
    module MonkeyPatch
      COMMAND_ALIASES = {
        'con' => 'continue',
        'rr' => 'reload!',
        'q' => 'q!'
      }

      def process_command(line)
        super(COMMAND_ALIASES.fetch(line.strip, line))
      end
    end

    prepend MonkeyPatch
  end
end

require '/Users/jerome/.console_functions'
