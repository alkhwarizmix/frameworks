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

package dz.alkhwarizmix.framework.flex.dtos.customize.model.vo
{

import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٨ محرم ١٤٣٥ (November 22, 2013)
 */
[Bindable]
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.customize.model.vo.CustomData")]
public class CustomDataVO extends AlKhwarizmixVO
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function CustomDataVO(
		customDataId:String = null, customDataValue:String = null)
	{
		this.customDataId = customDataId;
		this.customDataValue = customDataValue;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  customDataId
	//----------------------------------
	
	private var _customDataId:String = null;
	public function get customDataId():String { return _customDataId; }
	
	public function set customDataId(value:String):void
	{
		if (_customDataId == value)
			return;
		_customDataId = value;
	}
	
	//----------------------------------
	//  customDataValue
	//----------------------------------
	
	private var _customDataValue:String = null;
	public function get customDataValue():String { return _customDataValue; }
	
	public function set customDataValue(value:String):void
	{
		if (_customDataValue == value)
			return;
		_customDataValue = value;
	}
	
} // Class
} // Package