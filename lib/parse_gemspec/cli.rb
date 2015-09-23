require 'logger'
require 'parse_gemspec'

require 'parse_gemspec/cli/constants'
require 'parse_gemspec/cli/version'

module ParseGemspec
  module Cli
    def self.default_logger
      logger = Logger.new(STDERR)
      logger.progname = "ParseGemspec::Cli #{VERSION}"
      logger.level = Logger::WARN
      logger
    end

    def self.logger
      return @logger if @logger
      @logger = default_logger
    end

    class << self
      attr_writer :logger
    end
  end
end
