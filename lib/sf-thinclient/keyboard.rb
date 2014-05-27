
module ThinClient

	class Keyboard

		@keyboardEvent = ""
		@SYN_EVENT = ""

		# def initialize()
		# 	getKeyboardEvent()
		# end

		# 获取键盘设备
		def self.getKeyboardEvent()
			# getevent获取到的键盘的名字不是统一的,观察到的名字中都包含" USB"字样
			system("taskkill /f /IM adb.exe")
			system("adb kill-server")
			system("adb start-server")
			str = `adb shell getevent -p`
			

		    begin
		      events = str.scan(/\/dev\/input\/event.\r\n.* USB.*/)
		      Log.debug("Events:#{events}")
		      if (events.size != 2)
		      	  Log.error("Keyboard Not Found. It Cannot Work Without a Keyboard Connected to The ThinClient")
		      	  return false
		      end
		      @keyboardEvent = events[1].split(/\r/)[0]
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
			system("#{@SYN_EVENT}")
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

