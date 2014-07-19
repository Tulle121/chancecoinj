import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DiceRoller {
	public static Logger logger = LoggerFactory.getLogger(Blocks.class);

	public static void main(String[] args) {
		Blocks blocks = Blocks.getInstanceAndWait();
		while (true) {
			logger.info("Rolling dice");
			Roll.serviceRollRequests();
			try {
				Thread.sleep(1000*60); //once a minute, we run blocks.follow()
			} catch (InterruptedException e) {
				logger.error("Error during loop: "+e.toString());
			}
		}		
	}
}