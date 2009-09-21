require 'rails_generator' 
require 'rails_generator/commands' 


module StringEncryption #:nodoc:
  
  module Generator #:nodoc:  
    
    module Commands #:nodoc:  
      
      module Create 
        def encryption_key 
          key = ActiveSupport::SecureRandom.hex(14)
          
          unless options[:pretend] 
            #      gsub_file('config/environment.rb', /(#{Regexp.escape(look_for)})/mi){|match| "ENV['STRING_ENCRYPTION_KEY'] = #{key}"}  
            file = File.open("config/environment.rb", "a")
            file.print "\nENV['STRING_ENCRYPTION_KEY'] = \"#{key}\"\n"
          end
        end
      end
      module Destroy
        def encryption_key 
          gsub_file 'config/environment.rb', /ENV\['STRING_ENCRYPTION_KEY'\] = "\S{28}"/, ''  
        end 
      end  
      module List 
        def encryption_key 
        end  
      end  
      module Update 
        def encryption_key 
        end  
      end  
    end  
  end 
end 

Rails::Generator::Commands::Create.send  :include, StringEncryption::Generator::Commands::Create 
Rails::Generator::Commands::Destroy.send  :include, StringEncryption::Generator::Commands::Destroy 
Rails::Generator::Commands::List.send  :include, StringEncryption::Generator::Commands::List 
Rails::Generator::Commands::Update.send  :include, StringEncryption::Generator::Commands::Update