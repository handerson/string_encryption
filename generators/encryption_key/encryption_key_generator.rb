class EncryptionKeyGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.encryption_key
    end
  end
end
