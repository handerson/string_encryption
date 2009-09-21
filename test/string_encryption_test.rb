require File.dirname(__FILE__) + '/test_helper.rb' 

class StringEncryptionTest < Test::Unit::TestCase 
  def test_encrypt_not_equal_original
    assert_not_equal "Hello World", Knet::Encryption.encrypt("Hello World")
  end
  
  def test_decrypt_equals_original
    assert_equal "Hello World", Knet::Encryption.decrypt(Knet::Encryption.encrypt("Hello World")) 
  end 
end 
