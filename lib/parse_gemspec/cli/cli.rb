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

      desc 'parse', 'Parse *.gemspec'
      option :debug, type: :boolean, default: false
      option :verbose, type: :boolean, default: false
      option :load, type: :string, required: true, aliases: '-l'
      def parse
        setup_logger(options)
        puts MultiJson.dump(
          ParseGemspec::Specification.load(
            options[:load]
          ).to_hash_object
        )
      rescue StandardError => e
        suggest_messages(options)
        raise e
      end

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
      end
    end
  end
end
