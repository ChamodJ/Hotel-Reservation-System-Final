package util;


import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * This load Sql queries available in the EmployeeQuery.xml
 * 
 * @author Udara Samaratunge, SLIIT
 * @version 1.0
 * @see #CommonUtil
 */
public class QueryUtil extends CommonUtil {
   
	//private static final String FileName="/HotelReservationSystem/src/main/webapp/WEB-INF/UserQuery.xml";
	/**
	 * This method read the EmployeeQuery.xml file and retrieve the query by
	 * query id.
	 * 
	 * @param id
	 *            QueryID to retrieve elements
	 * 
	 * @return String formatted query will be returned as output
	 * 
	 * @throws ParserConfigurationException
	 *             - Indicates a serious configuration error.
	 * @throws IOException
	 *             - This class is the general class of exceptions produced by
	 *             failed or interrupted I/O operations.
	 * @throws SAXException
	 *             - Encapsulate a general SAX error or warning.
	 * 
	 * @see EmployeeServiceImpl#addEmployees()
	 * @see EmployeeServiceImpl#createEmployeeTable()
	 * @see EmployeeServiceImpl#displayAllEmployees()
	 * @see EmployeeServiceImpl#removeEmployee(String)
	 * 
	 */
	public static String queryByID(String id) {
	    try {
	    	//creating a constructor of file class and parsing an XML file  
<<<<<<< Updated upstream
	    	File file = new File("C:\\Users\\ASUS\\Documents\\GitHub\\Hotel-Reservation-System-Final\\src\\main\\webapp\\WEB-INF\\UserQuery.xml");  
=======
	    	File file = new File("C:\\Users\\ASUS\\Documents\\GitHub\\Hotel-Reservation-System-Final\\src\\main\\webapp\\WEB-INF\\Query.xml");  
>>>>>>> Stashed changes
	    	//an instance of factory that gives a document builder  
	    	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();  
	    	//an instance of builder to parse the specified xml file  
	    	DocumentBuilder db = dbf.newDocumentBuilder();  
	    	Document doc = db.parse(file);  
	    	doc.getDocumentElement().normalize();  
	    	System.out.println("Root element: " + doc.getDocumentElement().getNodeName());  
	    	
	    	NodeList nodeList = doc.getElementsByTagName(CommonConstants.TAG_NAME); 
	    	System.out.println("node list:"+nodeList.getLength());

	        // Extract the node from the node list using the query id
	        for (int i = 0; i < nodeList.getLength(); i++) {
	        	System.out.println("entered lopp ");
	        	
	            Element element = (Element) nodeList.item(i);
	            System.out.println(element.getAttribute(CommonConstants.ATTRIB_ID));
	            if (element.getAttribute(CommonConstants.ATTRIB_ID).equals(id)) {
	            	System.out.println("getattri");
	                return element.getTextContent().trim();
	            }
	        }
	    } catch (SAXException | IOException | ParserConfigurationException e) {
	        // Handle exceptions properly
	        e.printStackTrace();
	    }
	    return null; // Return null in case of errors or if the query ID is not found.
	}

}



