////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٦ هجري، فارس بلحواس (Copyright 2015 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.winrak.flex.model.vo
{

import mx.core.IFactory;

import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢١ رمضان ١٤٣٦ (July 08, 2015)
 */
[Bindable]
[RemoteClass(alias="dz.alkhwarizmix.framework.java.dtos.record.model.vo.Record")]
public class GeolocationVO extends AlKhwarizmixVO
	implements IFactory
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function GeolocationVO()
	{
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  horizontalAccuracy
	//----------------------------------
	
	private var _horizontalAccuracy:Number;
	public function get horizontalAccuracy():Number { return _horizontalAccuracy; }
	
	public function set horizontalAccuracy(value:Number):void
	{
		if (_horizontalAccuracy == value)
			return;
		_horizontalAccuracy = value;
	}
	
	//----------------------------------
	//  latitude
	//----------------------------------
	
	private var _latitude:Number;
	public function get latitude():Number { return _latitude; }
	
	public function set latitude(value:Number):void
	{
		if (_latitude == value)
			return;
		_latitude = value;
	}
	
	//----------------------------------
	//  longitude
	//----------------------------------
	
	private var _longitude:Number;
	public function get longitude():Number { return _longitude; }
	
	public function set longitude(value:Number):void
	{
		if (_longitude == value)
			return;
		_longitude = value;
	}
	
	//----------------------------------
	//  speed
	//----------------------------------
	
	private var _speed:Number;
	public function get speed():Number { return _speed; }
	
	public function set speed(value:Number):void
	{
		if (_speed == value)
			return;
		_speed = value;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	public function newInstance():*
	{
		return new GeolocationVO();
	}
	
} // Class
} // Package
