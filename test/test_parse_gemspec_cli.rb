require_relative 'helper'

module ParseGemspecCli
  class TestGemspec < Test::Unit::TestCase
    test 'version' do
      assert do
        !::ParseGemspecCli::VERSION.nil?
      end
    end
  end
end
