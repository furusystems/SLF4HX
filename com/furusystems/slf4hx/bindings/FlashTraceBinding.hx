package com.furusystems.slf4hx.bindings; 
import flash.Lib;
/**
 * ...
 * @author Andreas Rønning
 */
class FlashTraceBinding implements ILogBinding
{
	/* INTERFACE slf4hx.bindings.ILogBinding */
	public function new() {
		
	}
	private static var _lineNumber:Int = 0;
	public function print(owner:Dynamic, level:String, str:String):Void 
	{
		Lib.trace((_lineNumber++)+"\t"+owner + "\t" + level + "\t" +str);
	}
	
}