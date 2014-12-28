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

package dz.alkhwarizmix.framework.flex.dtos.security.model.vo
{

import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٣ ربيع الأول ١٤٣٦ (December 24, 2014)
 */
[Bindable]
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.security.model.vo.Group")]
public class GroupVO extends AlKhwarizmixVO
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  groupId
	//----------------------------------
	
	private var _groupId:String = null;
	public function get groupId():String { return _groupId; }
	
	public function set groupId(value:String):void
	{
		if (_groupId == value)
			return;
		_groupId = value;
	}
	
	//----------------------------------
	//  name
	//----------------------------------
	
	private var _name:String = null;
	public function get name():String { return _name; }
	
	public function set name(value:String):void
	{
		if (_name == value)
			return;
		_name = value;
	}
	
} // Class
} // Package
