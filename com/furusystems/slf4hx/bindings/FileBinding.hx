package com.furusystems.slf4hx.bindings;
import com.furusystems.slf4hx.Constants;
import haxe.Log;
import haxe.PosInfos;
import neko.io.File;
import neko.io.FileOutput;
import neko.FileSystem;

/**
 * ...
 * @author Ian Martins
 */

class FileBinding implements ILogBinding {
        private var _fname :String;
        private var _maxBytes :Int; // size of log file before rotating
        private var _backupCount :Int; // number of old log files to keep

        public function new(fname, ?maxBytes=0, ?backupCount=0) {
                _fname = fname;
                _maxBytes = maxBytes; // 0 for never rotate
                _backupCount = backupCount; // 0 for no backups
        }
	
	/* INTERFACE slf4hx.bindings.ILogBinding */
	private static var _lineNumber:Int = 0;
	public function print(owner:Dynamic, level:String, str:String):Void {
                checkRotate();
                try {
                        var fout = File.append(_fname, false);
                        fout.writeString(Date.now().toString() +" "+ owner +" "+ level +": "+ str +"\n");
                        fout.close();
                } catch (e :Dynamic) {
                  throw ["Couldn't open log", e[1]];
                }
	}

        private function checkRotate() {
                if (_maxBytes==0 || !FileSystem.exists(_fname) || FileSystem.stat(_fname).size<_maxBytes)
                        return;

                var name = function(prefix, index) return (index==0) ? prefix : prefix+"."+index;
                for( ii in -_backupCount...0 ) {
                        var fname1 = name(_fname,-ii-1);
                        var fname2 = name(_fname,-ii);
                        if (FileSystem.exists(fname1))
                                FileSystem.rename(fname1, fname2);
                }
        }
}