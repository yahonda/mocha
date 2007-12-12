require File.join(File.dirname(__FILE__), "..", "..", "test_helper")

require 'mocha/parameter_matchers/has_entries'
require 'mocha/inspect'

class HasEntriesTest < Test::Unit::TestCase
  
  include Mocha::ParameterMatchers
  
  def test_should_match_hash_including_specified_entries
    matcher = has_entries(:key_1 => 'value_1', :key_2 => 'value_2')
    assert matcher.matches?([{ :key_1 => 'value_1', :key_2 => 'value_2', :key_3 => 'value_3' }])
  end
  
  def test_should_not_match_hash_not_including_specified_entries
    matcher = has_entries(:key_1 => 'value_2', :key_2 => 'value_2', :key_3 => 'value_3')
    assert !matcher.matches?([{ :key_1 => 'value_1', :key_2 => 'value_2' }])
  end
  
  def test_should_describe_matcher
    matcher = has_entries(:key_1 => 'value_1', :key_2 => 'value_2')
    assert_equal "has_entries({:key_1 => 'value_1', :key_2 => 'value_2'})", matcher.mocha_inspect
  end
  
end