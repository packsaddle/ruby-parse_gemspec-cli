require 'logger'
require 'rubygems'
require 'parse_gemspec_cli/version'

module ParseGemspecCli
  ISSUE_URL =
    Gem::Specification.load(
      File.expand_path(
        File.join('..', '..', 'parse_gemspec_cli.gemspec'),
        __FILE__
      )
    ).homepage + '/issues/new'

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
