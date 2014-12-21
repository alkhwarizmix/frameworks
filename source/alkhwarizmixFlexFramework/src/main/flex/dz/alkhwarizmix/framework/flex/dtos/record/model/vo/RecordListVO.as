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

import mx.collections.ArrayCollection;

import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٨ صفر ١٤٣٦ (December 20, 2014)
 */
[Bindable]
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.record.model.vo.RecordList")]
public class RecordListVO extends AlKhwarizmixVO
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function RecordListVO()
	{
		// NOOP
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  list
	//----------------------------------
	
	private var _list:ArrayCollection = null;
	public function get list():ArrayCollection
	{
		if (!_list)
			_list = new ArrayCollection();
		return _list;
	}
	
	public function set list(value:ArrayCollection):void
	{
		if (_list == value)
			return;
		_list = value;
	}
	
} // Class
} // Package
