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

package dz.alkhwarizmix.framework.flex.utils
{

import mx.utils.ObjectUtil;

import dz.alkhwarizmix.framework.flex.testutils.AlKhwarizmixTestCase;

import org.flexunit.asserts.assertEquals;
import org.flexunit.asserts.assertFalse;
import org.flexunit.asserts.assertNotNull;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠١ جمادى الثانية ١٤٣٥ (March 31, 2014)
 */
public class CryptoUtilTestCase extends AlKhwarizmixTestCase
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
		return CryptoUtil;
	}
	
	override protected function get classUnderTestConstructorArg1():*
	{
		return "%%KeyForTest$#09";
	}
	
	private function get utCryptoUtil():CryptoUtil
	{
		return classInstanceUnderTest as CryptoUtil;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utCryptoUtil);
	}
	
	[Test]
	public function test01_encrypted_should_be_different_than_original_text():void
	{
		var textToEncrypt:String = "This is a text to encrypt 345 éè" +
			"م خ ة";
		var encrypted:String = utCryptoUtil.encrypt(textToEncrypt);
		assertFalse("", ObjectUtil.compare(textToEncrypt, encrypted) == 0);
	}
	
	[Test]
	public function test01_encrypted_text_then_decrypt_it_should_return_same():void
	{
		var textToEncrypt:String = "This is a text to encrypt 345 éè" +
			"م خ ة";
		var encrypted:String = utCryptoUtil.encrypt(textToEncrypt);
		var decrypted:String = utCryptoUtil.decrypt(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
} // class
} // package