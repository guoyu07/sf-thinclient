require "rubygems"
require "logger"
require "./../lib/sf-thinclient/myadb"
require "./../lib/sf-thinclient/image"
require "./../lib/sf-thinclient/input"
require "./../lib/sf-thinclient/keyboard"
require "./../lib/sf-thinclient/keycode"
require "./../lib/sf-thinclient/mouse"
require "./../lib/sf-thinclient/mylogger"
require "./../lib/sf-thinclient/error"
require "./../lib/sf-thinclient/version"

## Image
#puts ThinClient::Image.includeOnScreen?("123.png", 0.6, "200.200.136.50:5555")
#puts ThinClient::Image.mouseClick("123.png", 0.6, "200.200.136.50:5555")
#puts ThinClient::Image.tap("tmp.png", 0.6, "200.200.136.50:5555")
#puts ThinClient::Image.doubleClick("123.png", 0.6, "200.200.136.50:5555")
#puts ThinClient::Image.rightClick("123.png", 0.6, "200.200.136.50:5555")
#puts ThinClient::Image.press("123.png", 3, 0.6, "200.200.136.50:5555")

#puts ThinClient::Image.dragDrop("123.png", 0.6, 300,300, "200.200.136.50:5555")

## Input
#puts ThinClient::Input.text("acb", "200.200.136.50:5555")

## Mouse
#puts ThinClient::Mouse.moveTo(100,100, "200.200.136.50:5555")
#puts ThinClient::Mouse.rollClick(100,100,"200.200.136.50:5555")

## Keyboard
#puts ThinClient::Keyboard.sendKeys("alt+d", "200.200.136.50:5555")





#puts ThinClient::KeyCode.code2key(0x7f)
#puts ThinClient::KeyCode.key2code("KEY_VOLUMEUP")

