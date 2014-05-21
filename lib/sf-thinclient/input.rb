
module ThinClient
	class Input
		# input text
		def self.text(str)
			begin
			  str =str.to_s
			  strings = str.split(/ /)
			  strings.each{ |string|
			  	system("adb shell input text #{string}")
			  	Keyboard.sendKeys("space")
			  }
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			
		end

		# input tap
		def self.tap(x = 0, y = 0)
			begin
			  if (x == nil || y == nil)
			  	Log.error("Usage: dragDropImage(img, x, y)")
			  	print("Usage: dragDropImage(img, x, y)")
			  	return
			  end
			  x = x.to_i
			  y = y.to_i
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			system("adb shell input tap #{x}, #{y}")
		end

		# input keyevent
		def self.keyevent(keycode)
			system("adb shell input keyevent #{keycode}")
		end

		# input swipe
		def self.swipe(x1 = 0, y1 = 0, x2 = 0, y2 = 0)
			begin
			  if (x1 == nil || y1 == nil || x2 == nil || y2 == nil)
			  	Log.error("Usage: dragDropImage(img, x, y)")
			  	print("Usage: dragDropImage(img, x, y)")
			  	return
			  end
			  x1 = x1.to_i
			  y1 = y1.to_i
			  x2 = x2.to_i
			  y2 = y2.to_i
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			system("adb shell input swipe #{x1} #{y1} #{x2} #{y2}")
		end
	end
end