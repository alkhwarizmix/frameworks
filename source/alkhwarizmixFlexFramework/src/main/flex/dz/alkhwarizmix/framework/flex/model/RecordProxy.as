////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.model
{

import mx.core.IFactory;

import dz.alkhwarizmix.framework.flex.AlKhwarizmixConstants;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordVO;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixProxy;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٢ صفر ١٤٣٦ (December 04, 2014)
 */
public class RecordProxy extends AlKhwarizmixProxy
	implements IAlKhwarizmixProxy
{
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The proxy name
	 */
	public static const NAME:String = "RecordProxy";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 *
	 * @param data TODO: ASDOC
	 */
	public function RecordProxy(data:Object=null)
	{
		super(NAME, data);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override public function get changedNoteName():String
	{
		return AlKhwarizmixConstants.RECORD_PROXY_CHANGED;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @inheritDoc
	 */
	override public function getItemFactory():IFactory
	{
		return new RecordVO();
	}
	
} // Class
} // Package
