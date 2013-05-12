SLF4HS is a lightweight logging framework based on SLF4J, an abstract logging facade for Java.

SLF4HS offers a robust, performant logging API that integrates easily with whatever output solution you have by means of an ILogBinding interface.

Note that this is an adaptation rather than a port; The framework differs heavily from SLF4J's architecture

```
package;
import com.furusystems.slf4hx.loggers.Logger;
import com.furusystems.slf4hx.Logging;
class Tests 
{
  	private static var L:Logger = Logging.getLogger(Tests); //First, create a logger object associated with this class
		public function new() 
		{
			//To log messages, we call specialized logging methods on the logger object             
			L.debug("Hello debug"); //These are general debugging messages (your commonplace traces)
			L.info("Hello info"); //Slightly more important messages, for instance dealing with application status etc
			L.warn("Hello warn"); //Something untowards has happened, but it's not critical
			L.error("Hello error"); //Something bad has happened! But the application can still recover...
			L.fatal("Hello fatal"); //Something REALLY BAD has happened. It's game over for your app.
		}
}
```
