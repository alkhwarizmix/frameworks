////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٥ هجري، فارس بلحواس (Copyright 2013 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.model
{

import flash.utils.Dictionary;

import mx.core.IFactory;

import dz.alkhwarizmix.framework.flex.AlKhwarizmixConstants;
import dz.alkhwarizmix.framework.flex.dtos.customize.model.vo.CustomDataVO;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixProxy;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٠ محرم ١٤٣٥ (November 24, 2013)
 */
public class AlKhwarizmixCustomDataProxy extends AlKhwarizmixProxy
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
	public static const NAME:String = "AlKhwarizmixCustomDataProxy";
	
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
	public function AlKhwarizmixCustomDataProxy(data:Object=null)
	{
		super(NAME, data);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	private static var LOG:IAlKhwarizmixLogger = null;
	
	override protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixCustomDataProxy);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override public function get changedNoteName():String
	{
		return AlKhwarizmixConstants.CUSTOMDATA_PROXY_CHANGED;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  configDico
	//----------------------------------
	
	public function get configDico():Dictionary
	{
		if (!getData())
			setData(new Dictionary());
		return (getData() as Dictionary);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @inheritDoc
	 */
	override public function getItemFactory():IFactory
	{
		return new CustomDataVO();
	}
	
} // Class
} // Package
