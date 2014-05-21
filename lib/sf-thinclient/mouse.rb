
module ThinClient
	class Mouse
		@mouseEvent = ""
		@SYN_EVENT = ""
		@realX = 1920.0
		@realY = 1080.0
		@virtualX = 1280.0
		@virtualY = 720.0
		# 瘦客户机上移动n个像素，实际需要移动n+n*0.2的
		@diffX = 0.2
		@diffY = 0.2
		def initialize()
			getMouseEvent()
		end
		# 先设定独享桌面的分辨率
		def self.setResolution(x = 1280, y = 720)
			@virtualX = x
			@virtualY = y
		end
		def self.getMouseEvent()
			if @mouseEvent != ""
				return true
			end
			str = `adb shell getevent -p`
		    begin
		      events = str.scan(/\/dev\/input\/event.\r\n.* Mouse.*/)
		      Log.debug("Events:#{events}")
		      if (events.size != 1)
		      	  Log.error("Mouse Not Found. It Cannot Work Without a Mouse Connected to The ThinClient")
		      	  return false
		      end
		      @mouseEvent = events[0].split(/\r/)[0]
		      
		      @SYN_EVENT = "adb shell sendevent #{@mouseEvent} 0 0 0"

		      setResolution()
		      #print @mouseEvent
		      return true
		    rescue => ex
		      Log.error("#{ex}")
		      print ex
		      return false
		    end
		end

		# 向左移动(n个像素)
		def self.left(n = 1)
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			getMouseEvent()
			n = n / (1 + @diffX)
			system("adb shell sendevent #{@mouseEvent} 2 0 -#{n}")
			system("#{@SYN_EVENT}")
		end
		# 向右移动(n个像素)
		def self.right(n = 1)
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			getMouseEvent()
			n = n / (1 + @diffX)
			system("adb shell sendevent #{@mouseEvent} 2 0 #{n}")
			system("#{@SYN_EVENT}")
		end
		# 向上移动(n个像素)
		def self.up(n = 1)
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			getMouseEvent()
			n = n / (1 + @diffY)
			system("adb shell sendevent #{@mouseEvent} 2 1 -#{n}")
			system("#{@SYN_EVENT}")
		end
		# 向下移动(n个像素)
		def self.down(n = 1)
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			getMouseEvent()
			n = n / (1 + @diffY)
			system("adb shell sendevent #{@mouseEvent} 2 1 #{n}")
			system("#{@SYN_EVENT}")
		end

		# 移动到某个位置
		def self.moveTo(x = nil, y = nil)
			if false === getMouseEvent()
				return false
			end
			if (x != nil && y != nil)
				left(5000)
				up(5000)
				right(x)
				down(y)
				return 
			end
			if (x != nil)
				left(5000)
				right(x)
			end
			if (y != nil)
				up(5000)
				down(y)
			end
		end



		# 左键按下
		def self.leftBtnDown()
			system("adb shell sendevent #{@mouseEvent} 1 272 1")
			system("#{@SYN_EVENT}")
		end
		# 左键抬起
		def self.leftBtnUp()
			system("adb shell sendevent #{@mouseEvent} 1 272 0")
			system("#{@SYN_EVENT}")
		end
		# 右键按下
		def self.rightBtnDown()
			system("adb shell sendevent #{@mouseEvent} 1 273 1")
			system("#{@SYN_EVENT}")
		end
		# 右键抬起
		def self.rightBtnUp()
			system("adb shell sendevent #{@mouseEvent} 1 273 0")
			system("#{@SYN_EVENT}")
		end
		# 滚轮按下
		def self.middleBtnDown()
			system("adb shell sendevent #{@mouseEvent} 1 274 1")
			system("#{@SYN_EVENT}")
		end
		# 滚轮抬起
		def self.middleBtnUp()
			system("adb shell sendevent #{@mouseEvent} 1 274 0")
			system("#{@SYN_EVENT}")
		end

		# 单击(某个坐标)
		def self.click(x = nil, y = nil)
			moveTo(x, y)
			leftBtnDown()
			leftBtnUp()
		end
		# 双击(某个坐标)
		def self.doubleClick(x = nil, y = nil)
			moveTo(x, y)
			leftBtnDown()
			leftBtnUp()
			leftBtnDown()
			leftBtnUp()
		end
		# 按下(按下时间,某个坐标)
		def self.press(t = 2, x = nil, y = nil)
			moveTo(x, y)
			leftBtnDown()
			sleep(t)
			leftBtnUp()
		end
		# 拖拽
		def self.dragDrop(x1 = 0, y1 = 0, x2 = 0, y2 = 0)
			moveTo(x1, y1)
			leftBtnDown()
			#moveTo(x2, y2)
			begin
			  x1 = x1.to_i
			  y1 = y1.to_i
			  x2 = x2.to_i
			  y2 = y2.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			right(x2 - x1)
			down(y2 - y1)
			leftBtnUp()
		end
		# 右击
		def self.rightClick(x = nil, y = nil)
			moveTo(x, y)
			rightBtnDown()
			rightBtnUp()
		end

		# 滚轮向下滚动
		def self.rollDown(n = 1)
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end
			if false === getMouseEvent()
				return 
			end
			while (n > 0)
				system("adb shell sendevent #{@mouseEvent} 2 8 -1")
				system("#{@SYN_EVENT}")
				n -= 1
			end
		end	
		# 滚轮向上滚动
		def self.rollUp(n = 1)
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end
			if false === getMouseEvent()
				return 
			end
			while (n > 0)
				system("adb shell sendevent #{@mouseEvent} 2 8 1")
				system("#{@SYN_EVENT}")
				n -= 1
			end
		end
		# 单击滚轮
		def self.rollClick()
			if false === getMouseEvent()
				return 
			end
			middleBtnDown()
			middleBtnUp()
		end

		# 单击图片
		def self.clickImage(img, similar = 0.8)
			position = Image.getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			click(position[:X], position[:Y])
			return true
		end

		# 双击图片
		def self.doubleClickImage(img, similar = 0.8)
			position = Image.getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			doubleClick(position[:X], position[:Y])
			return true
		end

		# 右击图片
		def self.rightClickImage(img, similar = 0.8)
			position = Image.getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			rightClick(position[:X], position[:Y])
			return true
		end

		# 长按图片
		def self.pressImage(img, t = 2, similar = 0.8)
			position = Image.getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			press(t, position[:X], position[:Y])
			return true
		end

		# 拖拽图片到指定位置
		def self.dragDropImage(img, x = 0, y = 0, similar = 0.8)
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
			position = Image.getPositionOnScreen(img, similar)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			dragDrop(position[:X], position[:Y], x, y)
			return true
		end

		# 拖拽图片1到图片2上
		def self.dragDropImagetoImage(img1, img2, similar1 = 0.8, similar2 = 0.8)
			position1 = Image.getPositionOnScreen(img, similar1)
			position2 = Image.getPositionOnScreen(img2, similar2)
			if (position1[:X] === 0 || position1[:Y] === 0 || position2[:X] === 0 || position2[:Y] ===0)
				return false
			end
			dragDrop(position1[:X], position1[:Y], position2[:X], position2[:Y])
			return true
		end


	end
end