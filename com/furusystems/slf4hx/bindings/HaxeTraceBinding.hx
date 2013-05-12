package com.furusystems.slf4hx.bindings;
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
		trace(level+"\t"+str);
	}
	
}