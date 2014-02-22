class String
  def underscore
    self.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    tr(" ", "_").
    downcase
  end
end

class Test2
  def self.my_hash
   {
  "apk" => "file",
  "apktool" => "file",
  "output directory" => "dir",
  "dex2jar" => "file"
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
  
    
=begin def self.run
  puts "Please specify the path of the APK file: "
  apk_location = gets.chomp
  puts "Please specify the path of the Dex2Jar executable: "
  dex2jar_location = gets.chomp
  puts "Please specify the path of the APK Tool executable: "
  apktool_location = gets.chomp
  puts "Please specify the output file location: "
  outputfile_location = gets.chomp
  end
=end
end

