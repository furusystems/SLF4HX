package com.furusystems.slf4hx.bindings;
import com.furusystems.slf4hx.Constants;
import haxe.Log;
import haxe.PosInfos;

/**
 * ...
 * @author Andreas Rønning
 */

class HaxeTraceBinding implements ILogBinding
{

	public function new() 
	{
#if flash
		Log.setColor(0xFF0000);
#end
	}
	
	/* INTERFACE slf4hx.bindings.ILogBinding */
	private static var _lineNumber:Int = 0;
	public function print(owner:Dynamic, level:String, str:String):Void 
	{
		//switch(Levels.getID(level)) {
			//case Levels.DEBUG:
				//Log.setColor(0x333333);
			//case Levels.ERROR:
				//Log.setColor(0xFF0000);
			//case Levels.INFO:
				//Log.setColor(0);
			//case Levels.WARN:
				//Log.setColor(0xFFFF00);
			//case Levels.FATAL:
				//Log.setColor(0x00FFFF);
			//default:
				//Log.clear();
		//}
		trace((_lineNumber++) + "\t" + owner + "\t" + level + "\t" +str, null);
	}
	
}