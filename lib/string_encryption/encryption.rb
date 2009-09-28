module Knet
  module Encryption
    def self.decrypt(encrypted_data)
      des = OpenSSL::Cipher::Cipher.new("des-ede3-cbc")
      des.decrypt
      des.key = ENV['STRING_ENCRYPTION_KEY']
      encrypted_data = URI.unescape(encrypted_data)
      encrypted_data = Base64.decode64(encrypted_data)
      
      des.iv =  encrypted_data.slice!(0,8)
      
      des.update(encrypted_data) + des.final  
    end
    
    def self.encrypt(string)
      des = OpenSSL::Cipher::Cipher.new("des-ede3-cbc")
      des.encrypt
      des.key = ENV['STRING_ENCRYPTION_KEY']
      
      des.iv = iv = ActiveSupport::SecureRandom.hex(4)
      
      data = des.update(string) + des.final  
      data = iv + data
      data = Base64.encode64(data)
      data = URI.escape(data, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))
    end
  end
end