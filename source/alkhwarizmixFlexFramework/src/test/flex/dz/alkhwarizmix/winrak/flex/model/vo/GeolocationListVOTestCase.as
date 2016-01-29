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

import mx.collections.ArrayCollection;

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
public class GeolocationListVOTestCase extends AlKhwarizmixTestCase
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
		return GeolocationListVO;
	}
	
	private function get utGeolocationListVO():GeolocationListVO
	{
		return classInstanceUnderTest as GeolocationListVO;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test01_constructor():void
	{
		assertNotNull(utGeolocationListVO);
	}
	
	[Test]
	public function test01_A_list_never_returns_null():void
	{
		assertNotNull(utGeolocationListVO.list);
		utGeolocationListVO.list = null;
		assertNotNull(utGeolocationListVO.list);
	}
	
	[Test]
	public function test01_B_list_setAndGet():void
	{
		var valueToSet:ArrayCollection = new ArrayCollection();
		valueToSet.addItem(new GeolocationVO());
		utGeolocationListVO.list = valueToSet;
		assertEquals(1, utGeolocationListVO.list.length);
		assertEquals(valueToSet, utGeolocationListVO.list);
	}
	
} // class
} // package
