package com.furusystems.slf4hx.bindings; 
/**
 * ...
 * @author Andreas Rønning
 */
interface ILogBinding 
{
	public function print(owner:Dynamic, level:String, str:String):Void;
}