package com.furusystems.slf4hx.bindings;
import com.furusystems.slf4hx.constants.Levels;
import haxe.Log;
import haxe.PosInfos;

/**
 * ...
 * @author Miha Lunar
 */

class StandardStreamBinding implements ILogBinding
{

	public function new() {}
	
	/* INTERFACE slf4hx.bindings.ILogBinding */
	private static var _lineNumber:Int = 0;
	public function print(owner:Dynamic, level:String, str:String):Void 
	{
		if (Levels.getID(level) >= Levels.ERROR) {
			Sys.stderr().writeString(level+"\t"+str+"\n");
		} else {
			Sys.stdout().writeString(level+"\t"+str+"\n");
		}
	}
	
}