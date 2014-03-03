require 'utilities/string'
require 'utilities/parsing'
require 'decompiler/decompiler'
require 'optparse'

#This class is responsible for CLI output and options
class ApkUnpack
	#This method defines the CLI options of the gem and takes in the
	#YAML configuration file
	def self.run 
		options = {}
		OptionParser.new do |opts|
  			opts.banner = "Usage: example.rb [options]"
  			
  			opts.on("-c", "--config [Config File]", "Configuration file in YAML format") do |c|
    			options[:config_file] = c
  			end

			opts.on("-h", "--help", "Displays help information") do
    			puts opts 
    			exit
  			end
		end.parse!
		if !options.empty?
			 Parsing.parse(options[:config_file])
		else
  			Decompiler.run
		end
	end
end
