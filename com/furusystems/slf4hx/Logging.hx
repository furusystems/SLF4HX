package com.furusystems.slf4hx;
import com.furusystems.slf4hx.bindings.HaxeTraceBinding;
import com.furusystems.slf4hx.bindings.ILogBinding;
import com.furusystems.slf4hx.Constants;
import com.furusystems.slf4hx.loggers.Logger;
/**
 * ...
 * @author Andreas Rønning
 */
class Logging 
{
	public static var DEFAULT_APP_NAME:String = "Log";
	
	private static var _root:Logger = null;
	private static var _patternType:PatternType = PatternType.NONE;
	private static var _appName:String = "Log";
	private static var _minLevel:LevelType = LevelType.ALL;
	
	public static var root(getRoot, null):Logger;
	public static var logBinding(default, default):ILogBinding;
        public static var patternType(default, default):PatternType;
	public static var level(default, default):Int;
	private static var initialized:Bool = false;
	public static function getLogger(tag:Dynamic):Logger {
		if (!initialized) {
			initialize();
		}
		if (Std.is(tag,Class)) {
			tag = Type.getClassName(tag).split(".").pop();
		}
		return new Logger(tag);
	}
	
	static private function initialize():Void 
	{
		initialized = true;
		if (logBinding == null) {
			logBinding = new HaxeTraceBinding();
		}
	}
	static public function print(tag:String, level:String, str:String):Void
	{
		if (logBinding!=null) {
			logBinding.print(tag, level, str);
		}
	}
	
	///getters and setters
	static private function getRoot():Logger 
	{
		if (_root == null) {
			_root = new Logger("Logging");
		}
		return _root;
	}
}