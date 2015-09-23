require_relative 'helper'

module ParseGemspec
  module Cli
    class TestGemspec < Test::Unit::TestCase
      test 'version' do
        assert do
          !::ParseGemspec::Cli::VERSION.nil?
        end
      end
    end
  end
end
