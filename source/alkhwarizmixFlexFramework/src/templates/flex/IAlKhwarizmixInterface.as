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

package dz.alkhwarizmix.templates.flex
{

import mx.core.IUIComponent;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٤ (August 22, 2013)
 */
public interface IAlKhwarizmixInterface extends IUIComponent
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  propertyWithGetAndSet1
	//----------------------------------
	
	/**
	 * @copy dz.alkhwarizmix.framework.flex.templates.AlKhwarizmixComponent#propertyWithGetAndSet1
	 */
	function get propertyWithGetAndSet1():String;
	
	/**
	 * @private
	 */
	function set propertyWithGetAndSet1(value:String):void;
	
	//----------------------------------
	//  propertyWithGetAndSet2
	//----------------------------------
	
	/**
	 * TODO: ASDOC Definition of propertyWithGetAndSet2
	 */
	function get propertyWithGetAndSet2():String;
	
	/**
	 * @private
	 */
	function set propertyWithGetAndSet2(value:String):void;
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @copy dz.alkhwarizmix.framework.flex.templates.AlKhwarizmixComponent#publicMethod1
	 */
	function publicMethod1():void
	
	/**
	 * TODO: ASDOC Definition of publicMethod2
	 */
	function publicMethod2():void
	
} // Interface
} // Package
