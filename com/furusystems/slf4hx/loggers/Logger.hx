package com.furusystems.slf4hx.loggers;

	import com.furusystems.slf4hx.Constants;
	import com.furusystems.slf4hx.Logging;
	import com.furusystems.slf4hx.utils.PatternResolver;
	/**
	 * ...
	 * @author Andreas Rønning
	 */
	class Logger
	{
		private var _tag:String;
		private var _patternType:PatternType;
		private var _inheritPattern:Bool;
		private var _useAppName:Bool;
		
		public var debug:Dynamic;
		public var info:Dynamic;
		public var error:Dynamic;
		public var warn:Dynamic;
		public var fatal:Dynamic;
		
		public function new(tag:String) 
		{
			_patternType = PatternType.SLF;
			_inheritPattern = true;
			_useAppName = tag == Logging.DEFAULT_APP_NAME;
			_tag = tag;
			
			debug = Reflect.makeVarArgs(adebug);
			info = Reflect.makeVarArgs(ainfo);
			warn = Reflect.makeVarArgs(awarn);
			error = Reflect.makeVarArgs(aerror);
			fatal = Reflect.makeVarArgs(afatal);
		}
		
		private function ainfo(args:Array<Dynamic>):Void 
		{
			args.unshift(LevelType.INFO);
			log(args);
		}
		
		private function adebug(args:Array<Dynamic>):Void 
		{
			args.unshift(LevelType.DEBUG);
			log(args);
		}
		
		private function aerror(args:Array<Dynamic>):Void 
		{
			args.unshift(LevelType.ERROR);
			log(args);
		}
		
		private function awarn(args:Array<Dynamic>):Void 
		{
			args.unshift(LevelType.WARN);
			log(args);
		}
		
		private function afatal(args:Array<Dynamic>):Void 
		{
			args.unshift(LevelType.FATAL);
			log(args);
		}

		private function log(args:Array<Dynamic>):Void 
		{
			var level:LevelType = args.shift();
			if (Logging.level.getIndex() > level.getIndex()) return;
			var levelStr:String = Std.string(level);
			var out:String = PatternResolver.resolve(_patternType, args);
			Logging.print(getTag(), levelStr, out);
		}
		private function getTag():String {
			return _tag;
		}
		
		public function setPatternType(type:PatternType):Void 
		{
			_patternType = type;
			_inheritPattern = false;
		}
		
		public function getPatternType():PatternType
		{
			if (_inheritPattern) {
				return Logging.patternType;
			}
			return _patternType;
		}
		
	}