require 'logger'
require 'rubygems'
require 'parse_gemspec_cli/constants'
require 'parse_gemspec_cli/version'

module ParseGemspecCli
  def self.default_logger
    logger = Logger.new(STDERR)
    logger.progname = "ParseGemspecCli #{VERSION}"
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
