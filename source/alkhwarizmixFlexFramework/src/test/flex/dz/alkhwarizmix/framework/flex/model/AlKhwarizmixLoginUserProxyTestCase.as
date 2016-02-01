////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٥ هجري، فارس بلحواس (Copyright 2014 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.model
{

import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.UserVO;
import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixPureMVCTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  Test for AlKhwarizmixLoginUserProxy
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢١ جمادى الأول ١٤٣٥ (March 21, 2014)
 */
public class AlKhwarizmixLoginUserProxyTestCase extends AlKhwarizmixPureMVCTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		super.setUp();
		
		testFacade.registerProxy(alkhwarizmixLoginUserProxy);
	}
	
	override protected function tearDown():void
	{
		testFacade.removeProxy(
			alkhwarizmixLoginUserProxy.getProxyName());
		
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return AlKhwarizmixLoginUserProxy;
	}
	
	private function get alkhwarizmixLoginUserProxy():AlKhwarizmixLoginUserProxy
	{
		return classInstanceUnderTest as AlKhwarizmixLoginUserProxy;
	}
	
	//--------------------------------------------------------------------------
	//
	//  HELPERS
	//
	//--------------------------------------------------------------------------
	
	// EMPTY
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(alkhwarizmixLoginUserProxy);
	}
	
	[Test]
	public function test01_changedNoteName():void
	{
		assertEquals("AlKhwarizmix_loginuser_proxy_changed",
			alkhwarizmixLoginUserProxy.changedNoteName);
	}
	
	[Test]
	public function test02_user_can_be_null():void
	{
		alkhwarizmixLoginUserProxy.setData(null);
		assertNull(alkhwarizmixLoginUserProxy.user);
	}
	
	[Test]
	public function test03_getItemFactory_should_return_UserVO():void
	{
		assertTrue(alkhwarizmixLoginUserProxy.getItemFactory() is UserVO);
	}
	
} // class
} // package
