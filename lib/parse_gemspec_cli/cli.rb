require 'thor'

module ParseGemspecCli
  class CLI < Thor
    def self.exit_on_failure?
      true
    end

    desc 'version', 'Show the ParseGemspecCli version'
    map %w(-v --version) => :version

    def version
      puts "ParseGemspecCli version #{VERSION}"
    end
  end
end
