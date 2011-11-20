package com.furusystems.slf4hx.utils; 
import com.furusystems.slf4hx.Constants;
import flash.Lib;
/**
 * ...
 * @author Andreas Rønning
 */
class PatternResolver 
{
	static private var SLF_DELIMITER:String = "{}";
	static public var LOOP_PATTERN:Bool = true;
	static public function resolve(patternType:PatternType, args:Array<Dynamic>):String 
	{
		switch(patternType) {
			//case PatternTypes.PRINT_F:
				//return args + ""; //TODO
			case PatternType.SLF:
				return resolveSLF(args);
			default:
				return args.join(" ");
		}
	}
	
	static private function resolveSLF(args:Array<Dynamic>):String 
	{
		if (args.length < 2 || cast(args[0], String).indexOf(SLF_DELIMITER) == -1) { 
			return args.join(" ");
		}
		var pat:String = args.shift();
		var split:Array<String> = pat.split(SLF_DELIMITER);
		if (split[split.length - 1] == "") {
			split.pop();
		}			
		var out:Array<String> = [];
		var counter:Int = 0;
		while (args.length > 0) {
			var arg:String = "" + args.shift();
			out.push(split[counter] + arg);
			counter++;
			if (counter > split.length - 1) {
				if (!LOOP_PATTERN) break;
				if(args.length>0){
					out.push(", "); //looping back over pattern
				}
				counter = 0;
			}
		}
		return out.join("");
	}
	
}