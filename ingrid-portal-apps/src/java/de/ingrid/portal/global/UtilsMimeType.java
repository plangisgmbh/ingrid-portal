package de.ingrid.portal.global;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * Utils class for get file extension
 * or getting a parent type by a MIME type
 * 
 * @author ktt
 */
public class UtilsMimeType {
	
	private static final String			MIME_TYP_BUNDLE		= "mimetype";
	
	private static Map<String, String>	mimeTypeToExtension	= null;
	
	private final static Log			log					= LogFactory.getLog(UtilsFileHelper.class);
	
	/**
	 * Get the Extension of a file by checking of MIME type
	 * 
	 * @param mimeType
	 * @return extension of the MIME type (e.g. image/jpeg -> jpg)
	 */
	public static String getFileExtensionOfMimeType(String mimeType) {
		readMimeTypeBundle();
		
		String ext = (String) mimeTypeToExtension.get(mimeType);
		
		if (ext == null) {
			ext = "dat";
			if (log.isInfoEnabled()) {
				log.info("Extension is not define in bundle for " + mimeType + ", file extension set to .dat");
			}
		}
		return ext;
	}
	
	/**
	 * Reading of MIME type bundle
	 */
	private static synchronized void readMimeTypeBundle() {
		if (mimeTypeToExtension != null)
			return;
		
		mimeTypeToExtension = new HashMap<String, String>();
		
		ResourceBundle bundle = ResourceBundle.getBundle(MIME_TYP_BUNDLE);
		for (Enumeration e = bundle.getKeys(); e.hasMoreElements();) {
			String type = (String) e.nextElement();
			try {
				String[] extensions = splitString(bundle.getString(type));
				
				if (mimeTypeToExtension.get(type) == null) {
					mimeTypeToExtension.put(type, extensions[0]);
				}
			}
			catch (MissingResourceException ex) {
				log.error("ERROR while reading MIME Type" + MIME_TYP_BUNDLE + " with type " + type, ex);
			}
		}
	}
	
	/**
	 * Splitting of reading MIME type bundle string
	 * 
	 * @param str
	 * @return a array of strings
	 */
	private static String[] splitString(String str) {
		String[] temp;
		
		String delimiter = "=";
		temp = str.split(delimiter);
		
		return temp;
	}
	
	/**
	 * Get parent of MIME type (e.g. image, audio, video ...)
	 * 
	 * @param mimetyp
	 * @return parent type of MIME type (e.g. image/jpeg -> image)
	 */
	public static String getMimeTypeParent(String mimetyp) {
		String[] temp;
		
		String delimiter = "/";
		temp = mimetyp.split(delimiter);
		
		return temp[0];
	}
}