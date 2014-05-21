require 'rubygems' if RUBY_VERSION =~ /^1.8/
require 'logger'

module ThinClient
	class Log
		def self.init()
			@myLogger = Logger.new(File.new(File.join("ThinClient.log"), "a"))
			@myLogger.datetime_format = "%m%d-%H:%M:%S"
		end
		
		def self.info(str)
			init()
			@myLogger.info(str)
		end

		def self.debug(str)
			init()
			@myLogger.debug(str)
		end

		def self.error(str)
			init()
			@myLogger.error(str)
		end

		def self.warn(str)
			init()
			@myLogger.warn(str)
		end

		def self.fatal(str)
			init()
			@myLogger.fatal(str)
		end
	end
end