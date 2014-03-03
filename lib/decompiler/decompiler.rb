# This class uses apktool and dex2jar to perform the de-compilation
# of APKs and outputs the results into their respective directories  
class Decompiler
  
  # This method creates a hash of the 4 inputs for the tool
  def self.my_hash
   {
  "apk" => "file",
  "apktool" => "file",
  "output directory" => "dir",
  "d2j-dex2jar .sh or .bat" => "file"
  }
  end
  
  # This method creates instance variable @k and fills up the array
  # my_hash with the 4 values its expecting
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
  
  # This method validates that the files and directories being
  # referenced exist   
  def self.exists(data_type, entity)  
  	val = instance_variable_get ("@#{entity}".underscore)
  	case data_type
  	when "dir"
  		Dir.exists?(val)
  	when "file"
  		File.exists?(val)
  	end 
  end
  
  # This method has the tool revert to having the user manually
  # enter the 4 parameters needed to run the tool in the case
  # the YAML config file does not exist
  def self.set_static_vars(opts={})
    raise "NoOptionsProvidedFromConfigFile" if opts.empty?
    @apktool = opts[:apktool]
    @output_directory = opts[:output_directory]
    @d2j_dex2jar_sh_or_bat = opts[:d2j]
  end  
  
  # This method defines the instance variable @apk as the location            
  # of the APK file that the user has provided.
  def self.set_apk_var(apk_loc = "")
     raise "NotAValidApkLocationValue" if !(apk_loc.kind_of?(String))
     raise "NoAPKProvidedFromConfigFile" if apk_loc.empty?
     @apk = apk_loc
   end
  
  # This method executes the run_apktool and run_dex2jar methods
  def self.execute
	run_apktool
	run_dex2jar
  end
  
  # This method converts periods "." within filenames to underscore
  def self.convert_apkname_to_underscore
  	file_name = File.basename(@apk).underscore.tr(".", "_")
  end
  
  # This method takes the file name of the .apk and converts it to
  # a .jar
  def self.convert_apk_to_jar
  	file_name = File.basename(@apk).sub(/.apk/, ".jar")
  end
  
  # This method runs apktool and outputs the results into its 
  # own directory
  def self.run_apktool
   	system "java", "-jar", @apktool, "d", "-f", @apk, "#{@output_directory}/apktool_output/#{self.convert_apkname_to_underscore}" 
  end
  
  # This method executes dex2jar and outputs the file under its own dex2jar directory
  def self.run_dex2jar
     	path = "#{@output_directory}/dex2jar_output"
     	Dir.mkdir path if not Dir.exist? path	
     	system @d2j_dex2jar_sh_or_bat, @apk, "-f", "-o", "#{path}/#{convert_apk_to_jar}" 
  end

end

