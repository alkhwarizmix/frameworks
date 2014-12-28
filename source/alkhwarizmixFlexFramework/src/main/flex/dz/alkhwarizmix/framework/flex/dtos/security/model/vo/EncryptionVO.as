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
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.security.model.vo.Encryption")]
public class EncryptionVO extends AlKhwarizmixVO
{
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  encryptionId
	//----------------------------------
	
	private var _encryptionId:String = null;
	public function get encryptionId():String { return _encryptionId; }
	
	public function set encryptionId(value:String):void
	{
		if (_encryptionId == value)
			return;
		_encryptionId = value;
	}
	
	//----------------------------------
	//  user
	//----------------------------------
	
	private var _user:UserVO = null;
	public function get user():UserVO { return _user; }
	
	public function set user(value:UserVO):void
	{
		if (_user == value)
			return;
		_user = value;
	}
	
} // Class
} // Package
