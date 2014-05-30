////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٥ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.resources
{

import flash.events.Event;

import mx.resources.ResourceManager;

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixLocalizable;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٧ رجب ١٤٣٥ (May 06, 2014)
 */
public class AlKhwarizmixResourceManager extends ResourceManager
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixResourceManager()
	{
		super();
		
		getInstance().addEventListener(Event.CHANGE, changeHandler);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of localizable
	 */
	private var localizable:IAlKhwarizmixLocalizable = null;
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * 
	 */
	public function registerLocalizable(localizable:IAlKhwarizmixLocalizable):void
	{
		this.localizable = localizable;
		localizable.localize = localize1;
	}
	
	/**
	 * 
	 */
	private function localize1(key:String = null, parameters:Array = null):String
	{
		return localize2(key, parameters);
	}
	
	/**
	 * 
	 */
	private function localize2(key:String = null, parameters:Array = null):String
	{
		key = localizable.resourceKeyPath + key;
		var result:String = ResourceManager.getInstance().getString(
			localizable.resourceBundleName, key, parameters);
		if (!result)
			result = key + "." + (parameters ? parameters.length : 0);
		return result;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	
	/**
	 * 
	 */
	private function changeHandler(event:Event):void
	{
		if (localizable)
		{
			localizable.localize = (localizable.localize == localize1)
				? localize2
				: localize1;
		}
	}
	
} // class
} // package