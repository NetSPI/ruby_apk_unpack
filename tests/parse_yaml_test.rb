require 'test/unit'
require 'lib/utilities/parsing'
require 'lib/decompiler/decompiler'

class ParseYamlTest < Test::Unit::TestCase
  
  def test_apk_tool_output
    Parsing.parse("tests/test.yaml", true)
    #assert Dir.exists?("#{ENV['APKTOOL_OUTPUT_LOCATION']}"))
  end
  
  def test_dex2jar_output
    #assert File.exists?("#{ENV['DEX2JAR_OUTPUT_LOCATION']}")
  end
  
end