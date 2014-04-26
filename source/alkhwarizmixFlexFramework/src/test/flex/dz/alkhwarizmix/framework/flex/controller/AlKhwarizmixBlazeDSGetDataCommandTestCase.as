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

package dz.alkhwarizmix.framework.flex.controller
{

import mx.messaging.channels.AMFChannel;
import mx.messaging.channels.SecureAMFChannel;

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertTrue;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٧ شوال ١٤٣٤ (August 24, 2013)
 */
public class AlKhwarizmixBlazeDSGetDataCommandTestCase extends AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	[Before]
	override public function setUp():void
	{
		super.setUp();
	}
	
	[After]
	override public function tearDown():void
	{
		super.tearDown();
	}
	
	override protected function get classUnderTest():Class
	{
		return AlKhwarizmixBlazeDSGetDataCommandEnhancedForTest;
	}
	
	private function get alKhwarizmixBlazeDSGetDataCommand():AlKhwarizmixBlazeDSGetDataCommandEnhancedForTest
	{
		return classInstanceUnderTest as AlKhwarizmixBlazeDSGetDataCommandEnhancedForTest;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test02_amfURI_should_throwMissingImplError():void
	{
		assert_should_throwMissingImplError(
			function ():void
			{
				alKhwarizmixBlazeDSGetDataCommand.amfURI;
			});
	}
	
	[Test]
	public function test03_operationName_should_throwMissingImplError():void
	{
		assert_should_throwMissingImplError(
			function ():void
			{
				alKhwarizmixBlazeDSGetDataCommand.operationName;
			});
	}
	
	[Test]
	public function test04_proxyName_should_throwMissingImplError():void
	{
		assert_should_throwMissingImplError(
			function ():void
			{
				alKhwarizmixBlazeDSGetDataCommand.proxyName;
			});
	}
	
	[Test]
	public function test05_isSecureConnexion_should_return_true_when_amfURI_has_https():void
	{
		alKhwarizmixBlazeDSGetDataCommand._amfURI = "http://dz.moqawalati.com";
		assertFalse(alKhwarizmixBlazeDSGetDataCommand.isSecureConnexion);
		alKhwarizmixBlazeDSGetDataCommand._amfURI = "https://dz.moqawalati.com";
		assertTrue(alKhwarizmixBlazeDSGetDataCommand.isSecureConnexion);
	}
	
	[Test]
	public function test06_should_use_SecureChannelSet_when_isSecureConnexion():void
	{
		alKhwarizmixBlazeDSGetDataCommand._amfURI = "https://dz.moqawalati.com";
		var amfChannel:AMFChannel = alKhwarizmixBlazeDSGetDataCommand.public_newAMFChannel();
		assertTrue(amfChannel is SecureAMFChannel);
	}
	
} // class
} // package

//--------------------------------------------------------------------------

import mx.messaging.channels.AMFChannel;

import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixBlazeDSGetDataCommand;

internal class AlKhwarizmixBlazeDSGetDataCommandEnhancedForTest extends AlKhwarizmixBlazeDSGetDataCommand
{
	public var _amfURI:String = null;
	override public function get amfURI():String
	{
		return (_amfURI ? _amfURI : super.amfURI);
	}
	
	public function public_newAMFChannel():AMFChannel
	{
		return newAMFChannel();
	}
	
}

//--------------------------------------------------------------------------