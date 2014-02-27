require 'yaml'

class Parsing
  
  def self.parse(file_location=nil, test=false)
    raise "NoFileProvidedForParsing" if !(file_location)
    yaml_c = test ? modify_yaml_attrs : parse_config_file(file_location) 
    opts = generate_options_from_yaml(yaml_c)   
    variable_set(opts)
  end
  
  def self.parse_config_file(file_location)
    yaml_c = YAML.load_file(file_location)
  end
  
  def self.modify_yaml_attrs
   yaml_c = {
   "apk" => ENV["APK"],
   "apktool" => ENV["APKTOOL"],
   "output_directory" => ENV["OUTPUT_DIR"],
   "d2j" => ENV["DEX2JAR"]
    }
  end
  
  def self.generate_options_from_yaml(yaml_c) 
     options = {}
     options[:apk] = yaml_c["apk"]
     options[:apktool] = yaml_c["apktool"]
     options[:output_directory] = yaml_c["output_directory"]
     options[:d2j] = yaml_c["d2j"]
    return options  
  end
  
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