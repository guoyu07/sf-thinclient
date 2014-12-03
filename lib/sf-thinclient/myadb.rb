module ThinClient
	class Myadb
		class << self
			# 通过tcp连接android
			def connect(device)
				ret = `adb connect #{device}`
				if (ret.include?("connected"))
					return true
				end
				Log.error(ret)
				return false
			end
			# 执行shell命令
			def shell(device, cmd)
				Log.debug("adb shell " + device+","+cmd)
				if (device == "onlyone")
					ret = `adb shell #{cmd}`
				else
					ret = `adb -s #{device} shell #{cmd}`
				end
				return false if ret.include?("error")
				return ret
			end

			# pull文件
			def pull(device, android_file, pc_file)
				if (device == "onlyone")
					ret = `adb pull #{android_file} #{pc_file}`
				else
					ret = `adb -s #{device} pull #{android_file} #{pc_file}`
				end
				return false if ret.include?("error")
				return ret
			end

			# push文件
			def push(device, pc_file, android_file)
				if (device == "onlyone")
					ret = `adb push #{pc_file} #{android_file}`
				else
					ret = `adb -s #{device} push #{pc_file} #{android_file}`
				end
				return false if ret.include?("error")
				return ret
			end

		end
	end
end


#puts ThinClient::Myadb.shell("onlyone", "ls;time")