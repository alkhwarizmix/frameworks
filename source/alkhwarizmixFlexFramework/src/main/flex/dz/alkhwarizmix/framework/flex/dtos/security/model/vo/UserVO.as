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

package dz.alkhwarizmix.framework.flex.dtos.security.model.vo
{

import mx.core.IFactory;

import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٨ ذو الحجة ١٤٣٤ (November 01, 2013)
 */
[Bindable]
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.security.model.vo.User")]
public class UserVO extends AlKhwarizmixVO
	implements IFactory
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  userId
	//----------------------------------
	
	private var _userId:String = null;
	public function get userId():String { return _userId; }
	
	public function set userId(value:String):void
	{
		if (_userId == value)
			return;
		_userId = value;
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
	
	//----------------------------------
	//  group
	//----------------------------------
	
	private var _group:GroupVO = null;
	public function get group():GroupVO { return _group; }
	
	public function set group(value:GroupVO):void
	{
		if (_group == value)
			return;
		_group = value;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	public function newInstance():*
	{
		return new UserVO();
	}
	
} // Class
} // Package
