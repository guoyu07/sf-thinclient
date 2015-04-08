
module ThinClient
	class KeyCode

		Code = [
			0x0001,  0x0002,  0x0003, 0x0004,
			0x0005,  0x0006,  0x0007, 0x0008,
			0x0009,  0x000a,  0x000b, 0x000c,
			0x000d,  0x000e,  0x000f, 0x0010,
			0x0011,  0x0012,  0x0013, 0x0014,  
			0x0015,  0x0016,  0x0017, 0x0018,
			0x0019,  0x001a,  0x001b, 0x001c,  
			0x001d,  0x001e,  0x001f, 0x0020,
			0x0021,  0x0022,  0x0023, 0x0024,  
			0x0025,  0x0026,  0x0027, 0x0028,
			0x0029,  0x002a,  0x002b, 0x002c,  
			0x002d,  0x002e,  0x002f, 0x0030,
			0x0031,  0x0032,  0x0033, 0x0034,  
			0x0035,  0x0036,  0x0037, 0x0038,
			0x0039,  0x003a,  0x003b, 0x003c,  
			0x003d,  0x003e,  0x003f, 0x0040,
			0x0041,  0x0042,  0x0043, 0x0044,  
			0x0045,  0x0046,  0x0047, 0x0048,
			0x0049,  0x004a,  0x004b, 0x004c,  
			0x004d,  0x004e,  0x004f, 0x0050,
			0x0051,  0x0052,  0x0053, 0x0056,  
			0x0057,  0x0058,  0x0059, 0x005c,
			0x005d,  0x005e,  0x005f, 0x0060,  
			0x0061,  0x0062,  0x0063, 0x0064,
			0x0066,  0x0067,  0x0068, 0x0069,  
			0x006a,  0x006b,  0x006c, 0x006d,
			0x006e,  0x006f,  0x0071, 0x0072,  
			0x0073,  0x0074,  0x0075, 0x0077,
			0x0079,  0x007a,  0x007b, 0x007c,  
			0x007d,  0x007e,  0x007f, 0x0080,
			0x0081,  0x0082,  0x0083, 0x0084,  
			0x0085,  0x0086,  0x0087, 0x0088,
			0x0089,  0x008a,  0x00b7, 0x00b8,
			0x00b9,  0x00ba,  0x00bb, 0x00bc,
			0x00bd,  0x00be,  0x00bf, 0x00c0,  
			0x00c1,  0x00c2,  0x00f0,
			#add
			0x007d,  0x0038,  0x001d, 0x002a,
			0x0029,  0x000c,  0x000d, 0x001a,
			0x001b,	 0X0027,  0X0028, 0X002B,
			0X0033,  0X0034,  0X0035,
			#add,2014-07-30
			0x0029,  0x000d,  0X002B, 0X0035,
			0x0063,  0x007f,
			#add,2015-03-10
			0x00b0

		]

		Key = [
			 "KEY_ESC",			"KEY_1",			"KEY_2",			"KEY_3",
			 "KEY_4",			"KEY_5",			"KEY_6",			"KEY_7",
			 "KEY_8",			"KEY_9",			"KEY_0",			"KEY_MINUS",
			 "KEY_EQUAL",		"KEY_BACKSPACE",	"KEY_TAB",			"KEY_Q",
			 "KEY_W",			"KEY_E",			"KEY_R",			"KEY_T",
			 "KEY_Y",			"KEY_U",			"KEY_I",			"KEY_O",
			 "KEY_P",			"KEY_LEFTBRACE",	"KEY_RIGHTBRACE",
			 "KEY_ENTER",		"KEY_LEFTCTRL",		"KEY_A","KEY_S",
			 "KEY_D",			"KEY_F",	"KEY_G",	"KEY_H",
			 "KEY_J",			"KEY_K",	"KEY_L",	"KEY_SEMICOLON",
			 "KEY_APOSTROPHE",  "KEY_GRAVE","KEY_LEFTSHIFT","KEY_BACKSLASH",
			 "KEY_Z",			"KEY_X",	"KEY_C",	"KEY_V",
			 "KEY_B",			"KEY_N",	"KEY_M",	"KEY_COMMA",
			 "KEY_DOT", 		"KEY_SLASH","KEY_RIGHTSHIFT","KEY_KPASTERISK",
			 "KEY_LEFTALT",		"KEY_SPACE","KEY_CAPSLOCK","KEY_F1",
			 "KEY_F2",			"KEY_F3",	"KEY_F4",	"KEY_F5",
			 "KEY_F6",			"KEY_F7",	"KEY_F8",	"KEY_F9",
			 "KEY_F10",			"KEY_NUMLOCK","KEY_SCROLLLOCK","KEY_KP7",
			 "KEY_KP8",			"KEY_KP9",	"KEY_KPMINUS","KEY_KP4",
			 "KEY_KP5",			"KEY_KP6",	"KEY_KPPLUS","KEY_KP1",
			 "KEY_KP2",			"KEY_KP3",	"KEY_KP0",	"KEY_KPDOT",
			 "KEY_102ND",		"KEY_F11",	"KEY_F12",	"KEY_RO",
			 "KEY_HENKAN",		"KEY_KATAKANAHIRAGANA","KEY_MUHENKAN","KEY_KPJPCOMMA",
			 "KEY_KPENTER",		"KEY_RIGHTCTRL","KEY_KPSLASH","KEY_SYSRQ",
			 "KEY_RIGHTALT",	"KEY_HOME","KEY_UP","KEY_PAGEUP",
			 "KEY_LEFT",		"KEY_RIGHT","KEY_END","KEY_DOWN",
			 "KEY_PAGEDOWN",	"KEY_INSERT","KEY_DELETE","KEY_MUTE",
			 "KEY_VOLUMEDOWN",	"KEY_VOLUMEUP","KEY_POWER","KEY_KPEQUAL",
			 "KEY_PAUSE",		"KEY_KPCOMMA","KEY_HANGEUL","KEY_HANJA",
			 "KEY_YEN",			"KEY_LEFTMETA","KEY_RIGHTMETA","KEY_COMPOSE",
			 "KEY_STOP",		"KEY_AGAIN","KEY_PROPS","KEY_UNDO",
			 "KEY_FRONT",		"KEY_COPY","KEY_OPEN","KEY_PASTE",
			 "KEY_FIND",		"KEY_CUT","KEY_HELP","KEY_F13",
			 "KEY_F14",			"KEY_F15","KEY_F16","KEY_F17",
			 "KEY_F18",			"KEY_F19","KEY_F20","KEY_F21","KEY_F22",
			 "KEY_F23",			"KEY_F24",	"KEY_UNKNOWN",
			 #add
			 "KEY_WIN", "KEY_ALT", "KEY_CTRL", "KEY_SHIFT",
			 "KEY_`",   "KEY_-",   "KEY_=",    "KEY_[",
			 "KEY_]",	"KEY_;",   "KEY_'",	   "KEY_\\",
			 "KEY_,", 	"KEY_.",   "KEY_/",
			 #add,2014-07-30
			 "KEY_~",   "KEY_PLUS",  "KEY_|",  "KEY_?",
			 "KEY_PRINTSCREEN","KEY_APPS",
			 "KEY_SETTING"

		]

		def self.key2code(key)
			begin
			  key = key.to_s		
			rescue => ex
			  Log.error("#{ex}")
			  print("#{ex}")
			end	
			index = Key.index(key)
			if (index != nil)
				return Code[index]
			end
			print "No such key:#{key}\n"
			Log.error("No such key:#{key}")
			return 0xffff
		end

		def self.code2key(code)
			index = Code.index(code)
			if (index != nil)
				return Key[index]
			end
			return "NULL"
		end


	end
end
