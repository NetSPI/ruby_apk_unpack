
class Decompiler
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
  
  def self.set_static_vars(opts={})
    raise "NoOptionsProvidedFromConfigFile" if opts.empty?
    @apktool = opts[:apktool]
    @output_directory = opts[:output_directory]
    @d2j_dex2jar_sh_or_bat = opts[:d2j]
  end  
  
  def self.set_apk_var(apk_loc = "")
     raise "NotAValidApkLocationValue" if !(apk_loc.kind_of?(String))
     raise "NoAPKProvidedFromConfigFile" if apk_loc.empty?
     @apk = apk_loc
   end
  
  def self.execute
	run_apktool
	run_dex2jar
  end
  
  def self.convert_apkname_to_underscore
  	file_name = File.basename(@apk).underscore
  end
  
  def self.convert_apk_to_jar
  	file_name = File.basename(@apk).sub(/.apk/, ".jar")
  end
  
  def self.run_apktool
   	system "java", "-jar", @apktool, "d", "-f", @apk, "#{@output_directory}/apktool_output_#{self.convert_apk_to_jar}" 
  end
  
  def self.run_dex2jar
     	path = "#{@output_directory}/dex2jar_output"
     	Dir.mkdir path if not Dir.exist? path	
     	system @d2j_dex2jar_sh_or_bat, @apk, "-f", "-o", "#{path}/#{convert_apk_to_jar}" 
  end

end

