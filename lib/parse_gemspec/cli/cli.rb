require 'thor'

module ParseGemspec
  module Cli
    class CLI < Thor
      def self.exit_on_failure?
        true
      end

      desc 'version', 'Show the ParseGemspec::Cli version'
      map %w(-v --version) => :version
      option :digit, type: :boolean, default: false
      def version
        if options[:digit]
          print VERSION
        else
          puts "ParseGemspec::Cli version #{VERSION}"
        end
      end

      desc 'parse GEMSPEC_PATH', 'Parse *.gemspec'
      option :debug, type: :boolean, default: false
      option :verbose, type: :boolean, default: false
      def parse(gemspec_path)
        setup_logger(options)
        print MultiJson.dump(
          ParseGemspec::Specification.load(
            gemspec_path
          ).to_hash_object
        )
      rescue StandardError => e
        suggest_messages(options)
        raise e
      end
      default_command :parse

      no_commands do
        def logger
          ::ParseGemspec::Cli.logger
        end

        def setup_logger(options)
          if options[:debug]
            logger.level = Logger::DEBUG
          elsif options[:verbose]
            logger.level = Logger::INFO
          end
          logger.debug(options)
        end

        def suggest_messages(options)
          logger.error 'Please report an issue here:'
          logger.error ISSUE_URL
          logger.error 'options:'
          logger.error options
        end

        # http://stackoverflow.com/a/23955971/104080
        def method_missing(method, *args)
          self.class.start([self.class.default_command, method.to_s] + args)
        end
      end
    end
  end
end
