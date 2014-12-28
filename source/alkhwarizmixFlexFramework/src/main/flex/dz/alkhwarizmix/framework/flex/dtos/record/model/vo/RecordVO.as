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

package dz.alkhwarizmix.framework.flex.dtos.record.model.vo
{

import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.EncryptionVO;
import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٢ صفر ١٤٣٦ (December 04, 2014)
 */
[Bindable]
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.record.model.vo.Record")]
public class RecordVO extends AlKhwarizmixVO
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	public static const INSERT_ACTION:int = 1;
	public static const UPDATE_ACTION:int = 2;
	public static const DELETE_ACTION:int = 3;
	
	/**
	 *  Constructor.
	 */
	public function RecordVO(
		recordId:String = null,
		schemaName:String = null,
		tableName:String = null,
		action:int = INSERT_ACTION)
	{
		this.recordId = recordId;
		this.schemaName = schemaName;
		this.tableName = tableName;
		this.action = action;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  encryption
	//----------------------------------
	
	private var _encryption:EncryptionVO = null;
	public function get encryption():EncryptionVO { return _encryption; }
	
	public function set encryption(value:EncryptionVO):void
	{
		if (_encryption == value)
			return;
		_encryption = value;
	}
	
	//----------------------------------
	//  recordId
	//----------------------------------
	
	private var _recordId:String = null;
	public function get recordId():String { return _recordId; }
	
	public function set recordId(value:String):void
	{
		if (_recordId == value)
			return;
		_recordId = value;
	}
	
	//----------------------------------
	//  schemaName
	//----------------------------------
	
	private var _schemaName:String = null;
	public function get schemaName():String { return _schemaName; }
	
	public function set schemaName(value:String):void
	{
		if (_schemaName == value)
			return;
		_schemaName = value;
	}
	
	//----------------------------------
	//  tableName
	//----------------------------------
	
	private var _tableName:String = null;
	public function get tableName():String { return _tableName; }
	
	public function set tableName(value:String):void
	{
		if (_tableName == value)
			return;
		_tableName = value;
	}
	
	//----------------------------------
	//  action
	//----------------------------------
	
	private var _action:int = INSERT_ACTION;
	public function get action():int { return _action; }
	
	public function set action(value:int):void
	{
		if (_action == value)
			return;
		_action = value;
	}
	
	//----------------------------------
	//  data
	//----------------------------------
	
	private var _data:String = null;
	public function get data():String { return _data; }
	
	public function set data(value:String):void
	{
		if (_data == value)
			return;
		_data = value;
	}
	
} // Class
} // Package
