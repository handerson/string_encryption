String.class_eval do 
  def encrypt 
    Knet::Encryption.encrypt(self)
  end
  
  def decrypt 
    Knet::Encryption.decrypt(self)
  end
end 
