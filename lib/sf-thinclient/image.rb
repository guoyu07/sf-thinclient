
module ThinClient
	class Image
		# 图片匹配程序ImageMatch.exe.如果没有找到则返回NO_IMAGEMATCH
		def self.setImageMatch(path = "ImageMatch.exe")
			@ImageMatch = path.nil? ? "ImageMatch.exe" : path
			# if not File.exist?(@ImageMatch)
			# 	print("ImageMatch.exe Not Found\n")
			# 	return ThinClient::Error::NO_IMAGEMATCH
			# end
			return ThinClient::Error::SUCCESS
		end

		# 查找图片坐标.任何错误导致的查找失败都返回坐标(0,0),查找成功返回具体坐标和查找时匹配的图片名称
		def self.getPosition(img1, img2, similar = 0.8)
			position = {:X => 0, :Y => 0, :resultImg => ""}
			if (ThinClient::Error::SUCCESS != setImageMatch())
				return position
			end
			if not File.exist?(img1)
				print("Image #{img1} Not Found\n")
				return position
			end
			if not File.exist?(img2)
				print("Image #{img2} Not Found\n")
				return position
			end
		
			info = `#{@ImageMatch} #{img1} #{img2} #{similar}`
			if 0 === info.split(/,/)[0]
				print("#{img1} and #{img2} Not Match\n")
				return position
			end

			position[:X] = info.split(/,/)[0].to_i
			position[:Y] = info.split(/,/)[1].to_i
			position[:resultImg] = info.split(/,/)[2].to_s
			return position
		end

		# 在当前屏幕中查找指定图片的坐标
		def self.getPositionOnScreen(img, similar = 0.8)
			if ThinClient::Error::SCREENCAP_FAIL == screenCap("tmp.png")
				return getPosition("", "")
			end
			return getPosition("tmp.png", img, similar)
		end

		# 查找图片是否存在
		def self.include?(img1, img2, similar = 0.8)
			position = getPosition(img1, img2, similar)
			if (position[:X] != 0 && position[:Y] != 0)
				return true
			end
			return false
		end

		# 在当前屏幕中是否存在指定图片
		def self.includeOnScreen?(img, similar = 0.8)
			if ThinClient::Error::SCREENCAP_FAIL == screenCap("tmp.png")
				return false
			end
			return include?("tmp.png", img, similar)

		end

		# 截图保存 
		def self.screenCap(name = "tmp.png")
			tempFile = "/sdcard/screen.png"
			system("adb shell screencap -p #{tempFile}")
			system("adb pull #{tempFile} #{name}")
			unless File.exist?(name)
				print "Screencap Fail\n"
				return ThinClient::Error::SCREENCAP_FAIL
			end
			return ThinClient::Error::SUCCESS

		end

		# 通过鼠标点击图片(无论是瘦客户机的还是虚拟桌面的都可以点击到)
		def self.mouseClick(img, similar = 0.8)
			position = getPositionOnScreen(img, similar)
			#puts position
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			#print ("position:#{position}\n")
			tmp = Mouse.click(position[:X], position[:Y])
			if (tmp === false)
				return false
			end
			return true
		end

		# 触摸图片(这个操作无法触摸到虚拟桌面内的图片)
		def self.tap(img, similar = 0.8)
			position = getPositionOnScreen(img, similar)

			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			#print ("position:#{position}\n")
			system("adb shell input tap #{position[:X]} #{position[:Y]}")
			return true
		end

		# 双击图片(移动鼠标,双击)
		def self.doubleClick(img, similar = 0.8)
			position = getPositionOnScreen(img, similar)

			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			return Mouse.doubleClick(position[:X], position[:Y])
		end

		# 长按图片
		def self.press(img, t = 2, similar = 0.8)
			position = getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			return Mouse.press(t, position[:X], position[:Y])
		end

		# 拖拽图片
		def self.dragDrop(img, similar = 0.8,  x = 0, y = 0)
			position = getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			return Mouse.dragDrop(position[:X], position[:Y], x, y)
		end

		# 右击图片
		def self.rightClick(img, similar = 0.8)
			position = getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			return Mouse.rightClick(position[:X], position[:Y])
		end

	end
end