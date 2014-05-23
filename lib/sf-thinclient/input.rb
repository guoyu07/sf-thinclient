
module ThinClient
	class Input
		# input text
		def self.text(str)

			tmp = `adb shell input text`
			if not tmp.include?("input text")
				Log.error("Error: adb shell input text error.")
				print("Error: adb shell input text error.\n")
				return false
			end

			begin
			  str =str.to_s
			  if (str.length == 0)
			  	return true
			  end
			  strings = str.split(/ /)
			  system("adb shell input text #{strings[0]}")
			  if (strings.size > 1)
			  	strings[1..-1].each{ |string|
			  		system("adb shell input keyevent KEYCODE_SPACE")
			  		system("adb shell input text #{string}")
			  	}
			  end
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			return true
		end

		# input tap
		def self.tap(x = 0, y = 0)

			tmp = `adb shell input tap`
			if not tmp.include?("input tap")
				Log.error("Error: adb shell input tap error.")
				print("Error: adb shell input tap error.\n")
				return false
			end

			begin
			  if (x == nil || y == nil)
			  	Log.error("x or y == nil")
			  	print("x or y == nil")
			  	return false
			  end
			  x = x.to_i
			  y = y.to_i
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			system("adb shell input tap #{x} #{y}")
			return true
		end

		# input keyevent
		def self.keyevent(keycode)

			tmp = `adb shell input keyevent`
			if not tmp.include?("input keyevent")
				Log.error("Error: adb shell input keyevent error.")
				print("Error: adb shell input keyevent error.\n")
				return false
			end

			tmp2 = `adb shell input keyevent #{keycode}"`
			if tmp2.include?("Error")
				return false
			end

			return true
		end

		# input swipe
		def self.swipe(x1 = 0, y1 = 0, x2 = 0, y2 = 0)
			tmp = `adb shell input swipe`
			if not tmp.include?("input swipe")
				Log.error("Error: adb shell input swipe error.")
				print("Error: adb shell input swipe error.\n")
				return false
			end
			begin
			  if (x1 == nil || y1 == nil || x2 == nil || y2 == nil)
			  	Log.error("Usage: dragDropImage(img, x, y)")
			  	print("Usage: dragDropImage(img, x, y)")
			  	return false
			  end
			  x1 = x1.to_i
			  y1 = y1.to_i
			  x2 = x2.to_i
			  y2 = y2.to_i
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			system("adb shell input swipe #{x1} #{y1} #{x2} #{y2}")
			return true
		end
	end
end