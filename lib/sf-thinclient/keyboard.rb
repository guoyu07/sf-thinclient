
module ThinClient

	class Keyboard

		@keyboardEvent = ""
		@SYN_EVENT = ""

		def initialize()
			getKeyboardEvent()
		end

		# 获取键盘设备
		def self.getKeyboardEvent()
			# getevent获取到的键盘的名字不是统一的,观察到的名字中都包含" USB"字样
			#Log.debug("adb start-server ...")
			system("adb start-server")
			#Log.debug("start getevent ...")
			str = `adb shell getevent -p`
			#Log.debug("end getevent ...")

		    begin
			  events = str.downcase.scan(/\/dev\/input\/event.\r\n.*keyboard.*/)
		      Log.debug("Events:#{events}")
		      if (@keyboardEvent === "" && events.size != 2)
		      	  Log.debug("\"keyboard\" not match.")
			  else
			      @keyboardEvent = events[1].split(/\r/)[0]
		      end
		      events = str.downcase.scan(/\/dev\/input\/event.\r\n.* usb.*/)
		      Log.debug("Events:#{events}")
		      if (@keyboardEvent === "" && events.size != 2)
		      	  Log.debug("\" usb\" not match.")
			  else
			      @keyboardEvent = events[1].split(/\r/)[0]
		      end
			  if (@keyboardEvent === "")
				  Log.error("keyboard not found.")
				  return false
			  end
		      
		      @SYN_EVENT = "adb shell sendevent #{@keyboardEvent} 0 0 0"
		      
		      return true
		    rescue => ex
		      Log.error("#{ex}")
		      print ex
		      return false
		    end
		end

		# 按下键盘按键
		def self.keyDown(keycode)
			begin
			  keycode = keycode.to_s		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end
			system("adb shell sendevent #{@keyboardEvent} 1 #{keycode} 1")
			# 按下键盘时可以不发同步, 只要在抬起的时候发就型
			#system("#{@SYN_EVENT}")
			return true
		end

		# 抬起键盘按键
		def self.keyUp(keycode)
			begin
			  keycode = keycode.to_s		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			system("adb shell sendevent #{@keyboardEvent} 1 #{keycode} 0")
			system("#{@SYN_EVENT}")
			return true
		end

		# 发送键盘按键,多个按键用"+"隔开(按键名称见KeyCode.Key)
		def self.sendKeys(keys)
			if false === getKeyboardEvent()
				return false
			end
			args = dealArg(keys)
			if (args === false || args === [])
				return false
			end
			#Log.debug(`tasklist |findstr adb.exe`)
			args.each { |key|
				keyDown(key)
			}
			args.each { |key|
				keyUp(key)
			}
			return true
		end

		# 处理输入的参数
		def self.dealArg(keys)
			begin
			  keys = keys.to_s		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			args = []
			tmp = keys.split(/\+/)
			Log.debug("Keys:#{tmp}")
			tmp.each { |key|
				key = "KEY_" + key.upcase
				index = KeyCode.key2code(key)
				if (index == 0xffff)
					return args
				end
				args.push(index)
			}
			return args
		end
		

		

	end

end

