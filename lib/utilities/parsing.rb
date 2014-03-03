require 'yaml'

# This class performs all of the parsing associated with the YAML
# file or the reading in of the paths for the 4 variables
class Parsing
  
  # This method raises an error if a YAML file is not given
  def self.parse(file_location=nil, test=false)
    raise "NoFileProvidedForParsing" if !(file_location)
    yaml_c = test ? modify_yaml_attrs : parse_config_file(file_location) 
    opts = generate_options_from_yaml(yaml_c)   
    variable_set(opts)
  end
  
  # This method loads and parses the YAML config file
  def self.parse_config_file(file_location)
    yaml_c = YAML.load_file(file_location)
  end
  
  # This method creates a hash called yaml_c that takes in
  # the 4 environment variables defined
  def self.modify_yaml_attrs
   yaml_c = {
   "apk" => ENV["APK"],
   "apktool" => ENV["APKTOOL"],
   "output_directory" => ENV["OUTPUT_DIR"],
   "d2j" => ENV["DEX2JAR"]
    }
  end
  
  # This method reads in the options from the YAML file
  # and assigns them the hash values within the yaml_c hash
  def self.generate_options_from_yaml(yaml_c) 
     options = {}
     options[:apk] = yaml_c["apk"]
     options[:apktool] = yaml_c["apktool"]
     options[:output_directory] = yaml_c["output_directory"]
     options[:d2j] = yaml_c["d2j"]
    return options  
  end
  
  # This method specifies executing the gem for the 3 options of
  # reading in the APK location manually, having a single APK within
  # the YAML file, or having multiple APKs within the YAML file
  def self.variable_set(options={})
    Decompiler.set_static_vars(options)
    apk_loc = options[:apk]
    if apk_loc.kind_of?(String)
      Decompiler.set_apk_var(apk_loc)
      Decompiler.execute
    elsif apk_loc.kind_of?(Array)
      apk_loc.each do |apkl|
        Decompiler.set_apk_var(apkl)
        Decompiler.execute
      end
    end
  end
   
end