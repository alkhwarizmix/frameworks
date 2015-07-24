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

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢١ رمضان ١٤٣٦ (July 08, 2015)
 */
public class GeolocationVOTestCase extends AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		// NOOP
	}
	
	override protected function tearDown():void
	{
		// NOOP
	}
	
	override protected function get shouldNotHaveLogger():Boolean
	{
		return true;
	}
	
	override protected function get classUnderTest():Class
	{
		return GeolocationVO;
	}
	
	private function get utGeolocationVO():GeolocationVO
	{
		return classInstanceUnderTest as GeolocationVO;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(utGeolocationVO);
	}
	
	[Test]
	public function test01_horizontalAccuracy_setAndGet():void {
		var valueToSet:Number = 200.56;
		utGeolocationVO.horizontalAccuracy = valueToSet;
		assertEquals(valueToSet, utGeolocationVO.horizontalAccuracy);
	}
	
	[Test]
	public function test02_latitude_setAndGet():void {
		var valueToSet:Number = 234.09;
		utGeolocationVO.latitude = valueToSet;
		assertEquals(valueToSet, utGeolocationVO.latitude);
	}
	
	[Test]
	public function test03_longitude_setAndGet():void {
		var valueToSet:Number = 34.90;
		utGeolocationVO.longitude = valueToSet;
		assertEquals(valueToSet, utGeolocationVO.longitude);
	}
	
	[Test]
	public function test04_speed_setAndGet():void {
		var valueToSet:Number = 90.09;
		utGeolocationVO.speed = valueToSet;
		assertEquals(valueToSet, utGeolocationVO.speed);
	}
	
} // class
} // package
