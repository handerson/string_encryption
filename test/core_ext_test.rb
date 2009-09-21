require File.dirname(__FILE__) + '/test_helper.rb' 

class CoreExtTest < Test::Unit::TestCase 
  def test_encrypt_not_equal_original
    assert_not_equal "Hello World", "Hello World".encrypt 
  end
  
  def test_encrypt_equals_decrypt_encrypt
    assert_equal "Hello World", "Hello World".encrypt.decrypt 
  end 
end 