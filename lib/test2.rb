class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    tr(" ", "_").
    tr(".", "_").
    downcase
  end
end

class Test2
  def self.my_hash
   {
  "apk" => "file",
  "apktool" => "file",
  "output directory" => "dir",
  "d2j-dex2jar .sh or .bat" => "file"
  }
  end
  
  def self.run
 	 my_hash.each do |k,v|
  		puts "Please specify the absolute location of the #{k}"
  		instance_variable_set("@#{k}".underscore, gets.chomp)
		unless self.exists(v,k)
			redo
		end
 	 end
 	 execute
 	 rescue ::Interrupt
 	 	puts "\nGoodbye"
  end
    
  def self.exists(data_type, entity)  
  	val = instance_variable_get ("@#{entity}".underscore)
  	case data_type
  	when "dir"
  		Dir.exists?(val)
  	when "file"
  		File.exists?(val)
  	end 
  end
  
  def self.execute
	run_apktool
	run_dex2jar
  end
  
  def self.run_apktool
   	system "java", "-jar", @apktool, "d", "-f", @apk, "#{@output_directory}/apktool_output" 
  end
  
  def self.run_dex2jar
     	path = "#{@output_directory}/dex2jar_output"
     	Dir.mkdir path if not Dir.exist? path
     	file_name = File.basename(@apk).sub(/.apk/, ".jar")
     	system @d2j_dex2jar__sh_or__bat, @apk, "-f", "-o", "#{path}/#{file_name}" 
  end
      

end

