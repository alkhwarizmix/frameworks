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
	
	private const CLEAR_TEXT:String = "This is a text to encrypt 345 éè" +
		"م خ ة";
	private const CLEAR_TEXT_AS_HEX:String = "546869732069732061207465787420746f20656e63727970742033343520c3a9c3a8d98520d8ae20d8a9";
	private const ENCRYPTED_BY_JAVA:String = "9800013c054878194737e873787291051c33432530ae1639d86cb0541f60450047ad0ac2b8b00fbd5635028039c4ee8f";
	
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
		return "1%KeyForT10t$#16%%K20ForTest2932";
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
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = utCryptoUtil.encryptString(textToEncrypt);
		assertFalse("", ObjectUtil.compare(textToEncrypt, encrypted) == 0);
	}
	
	[Test]
	public function test02_encrypted_text_then_decrypt_it_should_return_same():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = utCryptoUtil.encryptString(textToEncrypt);
		var decrypted:String = utCryptoUtil.decryptString(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
	[Test]
	public function test03_stringToHex():void
	{
		var textToConvert:String = CLEAR_TEXT;
		var hexString:String = utCryptoUtil.stringToHex(textToConvert);
		assertEquals(CLEAR_TEXT_AS_HEX, hexString);
	}
	
	[Test]
	public function test04_hexToString():void
	{
		var hexToConvert:String = CLEAR_TEXT_AS_HEX;
		var resultString:String = utCryptoUtil.hexToString(hexToConvert);
		assertEquals(CLEAR_TEXT, resultString);
	}
	
	[Test]
	public function test05_is_able_to_decrypt_java_encrypted_text():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = ENCRYPTED_BY_JAVA;
		var decrypted:String = utCryptoUtil.decryptString(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
	[Test]
	public function test06_encrypt_2_different_texts_should_give_2_different_results():void
	{
		var text1ToEncrypt:String = "Text1";
		var text2ToEncrypt:String = "Text2";
		var encrypted1:String = utCryptoUtil.encryptString(text1ToEncrypt);
		var encrypted2:String = utCryptoUtil.encryptString(text2ToEncrypt);
		assertFalse("", ObjectUtil.compare(encrypted1, encrypted2) == 0);
	}
	
} // class
} // package
