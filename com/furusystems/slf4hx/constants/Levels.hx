package com.furusystems.slf4hx.constants; 
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	class Levels 
	{
		public static var ALL:Int = 0;
		public static var DEBUG:Int = 1;
		public static var INFO:Int = 2;
		public static var WARN:Int = 3;
		public static var ERROR:Int = 4;
		public static var FATAL:Int = 5;
		public static var NONE:Int = 6;
		public static function getID(level:String):Int {
			var u:String = level.toUpperCase();
			if (Reflect.hasField(Levels, u)) {
				return Reflect.field(Levels, u);
			}
			return DEBUG;
		}
		public static function getName(id:Int):String {
			switch(id) {
				case 0:
				return "NONE";
				case 1:
				return "DEBUG";
				case 2:
				return "INFO";
				case 3:
				return "WARN";
				case 4:
				return "ERROR";
				case 5:
				return "FATAL";
				default:
				return "ALL";
			}
		}
	}