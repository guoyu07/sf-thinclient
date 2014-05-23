require "rubygems"
require "logger"
require "./../lib/sf-thinclient/image"
require "./../lib/sf-thinclient/input"
require "./../lib/sf-thinclient/keyboard"
require "./../lib/sf-thinclient/keycode"
require "./../lib/sf-thinclient/mouse"
require "./../lib/sf-thinclient/mylogger"
require "./../lib/sf-thinclient/error"
require "./../lib/sf-thinclient/version"

## Image类
ThinClient::Image.getPosition("img1.png", "img3.png", 0.8)
ThinClient::Image.getPositionOnScreen("img3.png", 0.8)
ThinClient::Image.includeOnScreen?("img2.png", 0.7)
ThinClient::Image.mouseClick("img2.png", 0.8)
ThinClient::Image.tap("img2.png", 0.8)
ThinClient::Image.doubleClick("hash.png")
ThinClient::Image.press("hash.png", 3, 0.8)
ThinClient::Image.dragDrop("hash.png", 0.8, 300, nil)
ThinClient::Image.rightClick("hash.png", 0.8)


## Mouse类
ThinClient::Mouse.left(100)
ThinClient::Mouse.right(100)
ThinClient::Mouse.up(100)
ThinClient::Mouse.down(100)
ThinClient::Mouse.moveTo(100, 100)
ThinClient::Mouse.click(200, 200 )
ThinClient::Mouse.doubleClick(200 ,200)
ThinClient::Mouse.press(3, 200, 200)
ThinClient::Mouse.dragDrop(200, 200, 400, 400)
ThinClient::Mouse.rightClick(200, 200)
ThinClient::Mouse.rollDown(3)
ThinClient::Mouse.rollUp(3)
ThinClient::Mouse.rollClick(100 , 100)

## Keyboard类
ThinClient::Keyboard.sendKeys("win+r")
ThinClient::Keyboard.sendKeys("a")


## Input类
ThinClient::Input.text("abcd efg")
ThinClient::Input.keyevent("KEYCODE_5")
ThinClient::Input.tap(100, 100)
ThinClient::Input.swipe(100, 100, 200, 200)



