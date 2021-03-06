////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٤ هجري، فارس بلحواس (Copyright 2013 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.model.vo
{

import com.googlecode.flexxb.FlexXBEngine;

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 30, 2013)
 */
public class AlKhwarizmixVO
{
	include "../../../../../../../../templates/flex/core/Version.as";

	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------

	private static var LOG:IAlKhwarizmixLogger = null;

	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixVO);
		return LOG;
	}	

	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixVO()
	{
		super();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	// EMPTY
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	public final function toXML():XML
	{
		return FlexXBEngine.instance.serialize(this);
	}
	
	public final function toXMLString():String
	{
		return toXML().toXMLString();
	}
	
	public final function fromXML(xml:XML):AlKhwarizmixVO
	{
		return FlexXBEngine.instance.deserialize(xml, getClassForXMLDeserializer());
	}
	
	public final function fromXMLString(xmlString:String):AlKhwarizmixVO
	{
		return fromXML(XML(xmlString));
	}
	
	protected function getClassForXMLDeserializer():Class
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
} // Class
} // Package
