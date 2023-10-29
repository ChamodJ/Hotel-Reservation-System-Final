package util;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class ErrorLogger {
	
	public static final  Logger log = Logger.getLogger(ErrorLogger.class.getName());
	
	
	public static void getLogger() {
		FileHandler fh;
		
		try {
			
			//Location to create Error Logger file
			fh = new FileHandler("G:/Final/ErrorLogger/logfile.log");
			
			log.addHandler(fh);
			SimpleFormatter formatter = new SimpleFormatter();
			fh.setFormatter(formatter);
			
			log.info("Logger Initialized");
			
			
		} catch (SecurityException e) {
			log.log(Level.SEVERE, "Security Exception :: " , e);
			
		} catch (IOException e) {
			e.printStackTrace();
			log.log(Level.SEVERE, "IO Exception :: " , e);
		}
	}
	
	
	  /*
	 //test case
	public static void main(String[] args) {
	    getLogger(); // Initialize the logger
	    
	    try {
	        // Attempt to open a non-existent file
	        FileInputStream fileInputStream = new FileInputStream("non_existent_file.txt");
	    } catch (IOException e) {
	        log.log(Level.SEVERE, "IO Exception occurred ::", e);
	    }
	    
	    
	}*/
	
	

	
}
