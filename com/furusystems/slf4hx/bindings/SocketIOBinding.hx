package com.furusystems.slf4hx.bindings;
import com.furusystems.slf4hx.constants.Levels;
import haxe.Log;
import haxe.PosInfos;
import js.npm.socketio.Manager;

/**
 * ...
 * @author Miha Lunar
 */

class SocketIOBinding implements ILogBinding {
	
	var manager:Manager;

	public function new(manager) {
		this.manager = manager;	
	}
	
	public function print(owner:Dynamic, level:String, str:String) {
		var id = Levels.getID(level);
		var log = manager.log;
		var s = str;
		//var s = owner+" "+str;
		if (id >= Levels.ERROR) {
			log.error(s);
		} else if (id == Levels.WARN) {
			log.warn(s);
		} else if (id == Levels.INFO) {
			log.info(s);
		} else {
			log.debug(s);
		}
	}
	
}