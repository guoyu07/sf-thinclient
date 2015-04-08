
module ThinClient
	class Mouse
		@mouseEvent = ""

		def initialize()
			getMouseEvent()
		end

		# _OK
		def self.getMouseEvent(device="onlyone")
			if @mouseEvent != ""
				return @mouseEvent
			end
			str = Myadb.shell(device, "getevent -p")
		    begin
		      events = str.downcase.scan(/\/dev\/input\/event.\r\n.*mouse.*/)
		      Log.debug("Events:#{events}")
		      
		      if (@mouseEvent === "" && events.size != 1)
		      	  Log.debug("\"mouse\" not match")
		      else
		          @mouseEvent = events[0].split(/\r/)[0]
		          return @mouseEvent
		  	  end

		  	  if (@mouseEvent === "")
		  	  	  events = str.downcase.scan(/\/dev\/input\/event.\r\n.*om.*/)
			      Log.debug("Events:#{events}")
				  if (@mouseEvent === "" && events.size != 1)
				  	  Log.debug("\"om\" not match")
			      else
			          @mouseEvent = events[0].split(/\r/)[0]
			          return @mouseEvent
			  	  end
		  	  end
			  
		  
	  	  	  if (@mouseEvent === "")
				  Log.error("Mouse Not Found.")
	  	  	  	  return false
	  	  	  end

		      return @mouseEvent
		    rescue => ex
		      Log.error("#{ex}")
		      print ex
		      return false
		    end
		end

		def self.sync(device)
			return Myadb.shell(device, "sendevent #{@mouseEvent} 0 0 0")
		end

		# 向左移动(n个像素)
		def self.left(n = 1, device = "onlyone")
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			if (false === getMouseEvent(device))
				return false
			end

			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 2 0 -#{n};sendevent #{@mouseEvent} 0 0 0;")
			return false if false == sync(device)
			return true
		end

		# 向右移动(n个像素)
		def self.right(n = 1, device = "onlyone")
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			if (false === getMouseEvent(device))
				return false
			end
	
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 2 0 #{n};sendevent #{@mouseEvent} 0 0 0;")
			return false if false == sync(device)
			return true
		end

		# 向上移动(n个像素)
		def self.up(n = 1, device = "onlyone")
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			if (false === getMouseEvent(device))
				return false
			end

			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 2 1 -#{n};sendevent #{@mouseEvent} 0 0 0;")
			return false if false == sync(device)
			return true
		end

		# 向下移动(n个像素)
		def self.down(n = 1, device = "onlyone")
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			if (false === getMouseEvent(device))
				return false
			end

			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 2 1 #{n};sendevent #{@mouseEvent} 0 0 0;")
			return false if false == sync(device)
			return true
		end

		# 移动到某个位置
		def self.moveTo(x = nil, y = nil, device = "onlyone")
			if false === getMouseEvent(device)
				return false
			end
			if (x != nil && y != nil)
				left(5000, device)
				up(5000, device)
				tmp1 = right(x, device)
				tmp2 = down(y, device)
				if (tmp1 === false || tmp2 ===false)
					return false
				end
				return true
			end
			if (x != nil && y == nil)
				left(5000, device)
				tmp = right(x, device)
				if (tmp === false)
					return false
				end
				return true
			end
			if (y != nil && x == nil)
				up(5000, device)
				tmp = down(y, device)
				if (tmp === false)
					return false
				end
				return true
			end
			if (x == nil && y == nil)
				return true
			end
			return false
		end



		# 左键按下
		def self.leftBtnDown(device = "onlyone")
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 1 272 1;sendevent #{@mouseEvent} 0 0 0;")
			return true
		end

		# 左键抬起
		def self.leftBtnUp(device = "onlyone")
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 1 272 0;sendevent #{@mouseEvent} 0 0 0;")
			return true
		end

		# 右键按下
		def self.rightBtnDown(device = "onlyone")
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 1 273 1;sendevent #{@mouseEvent} 0 0 0;")
			return true
		end

		# 右键抬起
		def self.rightBtnUp(device = "onlyone")
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 1 273 0;sendevent #{@mouseEvent} 0 0 0;")
			return true
		end

		# 滚轮按下
		def self.middleBtnDown(device = "onlyone")
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 1 274 1;sendevent #{@mouseEvent} 0 0 0;")
			return true
		end
		# 滚轮抬起
		def self.middleBtnUp(device = "onlyone")
			return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 1 274 0;sendevent #{@mouseEvent} 0 0 0;")
			return true
		end

		# 单击(某个坐标)
		def self.click(x = nil, y = nil, device = "onlyone")
			tmp = moveTo(x, y, device)
			if (tmp === false)
				return false
			end
			tmp1 = leftBtnDown(device)
			tmp2 = leftBtnUp(device)
			tmp3 = sync(device)
			if (tmp1 === false || tmp2 === false || tmp3 === false)
				return false
			end
			return true
		end
		# 双击(某个坐标)
		def self.doubleClick(x = nil, y = nil, device = "onlyone")
			tmp = moveTo(x, y,device)
			if (tmp === false)
				return false
			end
			tmp1 = leftBtnDown(device)
			tmp2 = leftBtnUp(device)
			tmp3 = leftBtnDown(device)
			tmp4 = leftBtnUp(device)
			tmp5 = sync(device)
			if (tmp1 === false || tmp2 ===false || tmp3 === false || tmp4 === false || tmp5 === false)
				return false
			end
			return true
		end
		# 按下(按下时间,某个坐标)
		def self.press(t = 2, x = nil, y = nil, device = "onlyone")
			tmp = moveTo(x, y, device)
			if (tmp === false)
				return false
			end
			tmp1 = leftBtnDown(device)
			tmp3 = sync(device)
			sleep(t)
			tmp2 = leftBtnUp(device)
			tmp4 = sync(device)
			if (tmp1 === false || tmp2 === false || tmp4 === false || tmp5 === false)
				return false
			end
			return true
		end
		# 拖拽
		def self.dragDrop(x1 = 0, y1 = 0, x2 = 0, y2 = 0, device = "onlyone")
			tmp = moveTo(x1, y1, device)
			if (tmp === false)
				return false
			end
			tmp1 = leftBtnDown(device)
			begin
			  x1 = x1.to_i
			  y1 = y1.to_i
			  x2 = x2.to_i
			  y2 = y2.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end	
			tmp2 = right(x2 - x1, device)
			tmp3 = down(y2 - y1, device)
			tmp4 = leftBtnUp(device)
			tmp5 = sync(device)
			if (tmp1 === false || tmp2 ===false || tmp3 === false || tmp4 === false || tmp5 === false)
				return false
			end
			return true
		end
		# 右击
		def self.rightClick(x = nil, y = nil, device = "onlyone")
			tmp = moveTo(x, y, device)
			if (tmp === false)
				return false
			end
			tmp1 = rightBtnDown(device)
			tmp2 = rightBtnUp(device)
			tmp3 = sync(device)
			if (tmp1 === false || tmp2 === false || tmp3 === false)
				return false
			end
			return true
		end

		# 滚轮向下滚动
		def self.rollDown(n = 1, device = "onlyone")
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end
			if false === getMouseEvent(device)
				return false
			end
			while (n > 0)
				return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 2 8 -1")
				return false if false == sync(device)
				n -= 1
			end
			return true
		end	
		# 滚轮向上滚动
		def self.rollUp(n = 1, device = "onlyone")
			begin
			  n = n.to_i		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			  return false
			end
			if false === getMouseEvent(device)
				return false
			end
			while (n > 0)
				return false if false == Myadb.shell(device, "sendevent #{@mouseEvent} 2 8 1")
				return false if false == sync(device)
				n -= 1
			end
			return true
		end
		# 单击滚轮
		def self.rollClick(x = nil, y = nil, device = "onlyone")
			tmp = moveTo(x, y,device)
			if (tmp === false)
				return false
			end
			tmp1 = middleBtnDown(device)
			tmp2 = middleBtnUp(device)
			tmp3 = sync(device)
			if (tmp1 === false || tmp2 === false || tmp3 === false)
				return false
			end
			return true
		end

		# 单击图片
		def self.clickImage(img, similar = 0.8, device = "onlyone")
			position = Image.getPositionOnScreen(img, similar, device)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			click(position[:X], position[:Y], device)
			return true
		end

		# 双击图片
		def self.doubleClickImage(img, similar = 0.8, device = "onlyone")
			position = Image.getPositionOnScreen(img, similar, device)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			doubleClick(position[:X], position[:Y], device)
			return true
		end

		# 右击图片
		def self.rightClickImage(img, similar = 0.8, device = "onlyone")
			position = Image.getPositionOnScreen(img, similar, device)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			rightClick(position[:X], position[:Y], device)
			return true
		end

		# 长按图片
		def self.pressImage(img, t = 2, similar = 0.8, device = "onlyone")
			position = Image.getPositionOnScreen(img, similar, device)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			press(t, position[:X], position[:Y], device)
			return true
		end

		# 拖拽图片到指定位置
		def self.dragDropImage(img, x = 0, y = 0, similar = 0.8, device = "onlyone")
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
			position = Image.getPositionOnScreen(img, similar,device)
			if (position[:X] === 0 || position[:Y] === 0)
				return false
			end
			dragDrop(position[:X], position[:Y], x, y, device)
			return true
		end

		# 拖拽图片1到图片2上
		def self.dragDropImagetoImage(img1, img2, similar1 = 0.8, similar2 = 0.8, device = "onlyone")
			position1 = Image.getPositionOnScreen(img, similar1, device)
			position2 = Image.getPositionOnScreen(img2, similar2, device)
			if (position1[:X] === 0 || position1[:Y] === 0 || position2[:X] === 0 || position2[:Y] ===0)
				return false
			end
			dragDrop(position1[:X], position1[:Y], position2[:X], position2[:Y], device)
			return true
		end


	end
end