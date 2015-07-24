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
 *  @since  ٢٣ رمضان ١٤٣٦ (July 10, 2015)
 */
public class CryptoUtilV3TestCase extends AlKhwarizmixTestCase
{
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	private const CLEAR_TEXT:String = "This is a text to encrypt 345 " + FRENCH_TEXT + ARABIC_TEXT;
	private const CLEAR_TEXT_AS_HEX:String = "546869732069732061207465787420746f20656e63727970742033343520c3a9c3a8d98520d8ae20d8a9";
	private const CLEAR_TEXT_AS_BASE64:String = "VGhpcyBpcyBhIHRleHQgdG8gZW5jcnlwdCAzNDUgw6nDqNmFINiuINip";
	// b27BnBDKsUj8vzeNQdCFK+6vjFrtHNZs5qDH2SAU170bqhpDKWg0v/h786qlWmnB
	private const ENCRYPTED_BY_JAVA:String = "9800013c054878194737e873787291051c33432530ae1639d86cb0541f60450047ad0ac2b8b00fbd5635028039c4ee8f";
	
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
		return CryptoUtilV3;
	}
	
	override protected function get classUnderTestConstructorArg1():*
	{
		return ARABIC_TEXT + "1%KeyForT10t$#16%" + FRENCH_TEXT + "%K20ForTest2932";
	}
	
	private function get utCryptoUtilV3():CryptoUtilV3
	{
		return classInstanceUnderTest as CryptoUtilV3;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utCryptoUtilV3);
	}
	
	[Test]
	public function test01_encrypted_should_be_different_than_original_text():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = utCryptoUtilV3.encryptString(textToEncrypt);
		assertFalse("", ObjectUtil.compare(textToEncrypt, encrypted) == 0);
	}
	
	[Test]
	public function test02_encrypted_text_then_decrypt_it_should_return_same():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = utCryptoUtilV3.encryptString(textToEncrypt);
		var decrypted:String = utCryptoUtilV3.decryptString(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
	[Ignore]
	[Test]
	public function test05_is_able_to_decrypt_java_encrypted_text():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = ENCRYPTED_BY_JAVA;
		var decrypted:String = utCryptoUtilV3.decryptString(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
	[Test]
	public function test06_encrypt_2_different_texts_should_give_2_different_results():void
	{
		var text1ToEncrypt:String = "Text1";
		var text2ToEncrypt:String = "Text2";
		var encrypted1:String = utCryptoUtilV3.encryptString(text1ToEncrypt);
		var encrypted2:String = utCryptoUtilV3.encryptString(text2ToEncrypt);
		assertFalse("", ObjectUtil.compare(encrypted1, encrypted2) == 0);
	}
	
	[Test]
	public function test08_encrypted_should_be_different_than_original_externalizable():void
	{
		var externalizableToEncrypt:ExternalizableForTest = new ExternalizableForTest(7765,
			CLEAR_TEXT);
		var encrypted:String = utCryptoUtilV3.encryptExternalizable(externalizableToEncrypt);
		assertFalse("", ObjectUtil.compare(externalizableToEncrypt, encrypted) == 0);
	}
	
	[Test]
	public function test09_encrypted_externalizable_then_decrypt_it_should_return_same():void
	{
		var externalizableToEncrypt:ExternalizableForTest = new ExternalizableForTest(7367,
			CLEAR_TEXT);
		var encrypted:String = utCryptoUtilV3.encryptExternalizable(externalizableToEncrypt);
		var decrypted:ExternalizableForTest = utCryptoUtilV3.decryptExternalizable(encrypted, ExternalizableForTest)
			as ExternalizableForTest;
		assertEquals(0, ObjectUtil.compare(externalizableToEncrypt, decrypted));
	}
	
} // class
} // package

//--------------------------------------------------------------------------

import flash.utils.IDataInput;
import flash.utils.IDataOutput;
import flash.utils.IExternalizable;

internal class ExternalizableForTest implements IExternalizable
{
	public var number:Number;
	public var string:String;
	
	/**
	 *  Constructor.
	 */
	public function ExternalizableForTest(pNumber:Number=0, pString:String=null)
	{
		number = pNumber;
		string = pString;
	}
	
	public function writeExternal(output:IDataOutput):void
	{
		output.writeDouble(number);
		output.writeUTF(string);
	}
	
	public function readExternal(input:IDataInput):void
	{
		number = input.readDouble();
		string = input.readUTF();
	}
}

//--------------------------------------------------------------------------
