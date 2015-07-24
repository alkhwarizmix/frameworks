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
import org.flexunit.asserts.assertNull;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠١ جمادى الثانية ١٤٣٥ (March 31, 2014)
 */
public class CryptoUtilV2TestCase extends AlKhwarizmixTestCase
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
		return CryptoUtilV2;
	}
	
	override protected function get classUnderTestConstructorArg1():*
	{
		return ARABIC_TEXT + "1%KeyForT10t$#16%" + FRENCH_TEXT + "%K20ForTest2932";
	}
	
	private function get utCryptoUtilV2():CryptoUtilV2
	{
		return classInstanceUnderTest as CryptoUtilV2;
	}
	
	//--------------------------------------------------------------------------
	//
	//  TESTS
	//
	//--------------------------------------------------------------------------
	
	[Test]
	public function test00_constructor():void
	{
		assertNotNull(utCryptoUtilV2);
	}
	
	[Test]
	public function test01_encrypted_should_be_different_than_original_text():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = utCryptoUtilV2.encryptString(textToEncrypt);
		assertFalse("", ObjectUtil.compare(textToEncrypt, encrypted) == 0);
	}
	
	[Test]
	public function test02_encrypted_text_then_decrypt_it_should_return_same():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = utCryptoUtilV2.encryptString(textToEncrypt);
		var decrypted:String = utCryptoUtilV2.decryptString(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
	[Ignore]
	[Test]
	public function test05_is_able_to_decrypt_java_encrypted_text():void
	{
		var textToEncrypt:String = CLEAR_TEXT;
		var encrypted:String = ENCRYPTED_BY_JAVA;
		var decrypted:String = utCryptoUtilV2.decryptString(encrypted);
		assertEquals(textToEncrypt, decrypted);
	}
	
	[Test]
	public function test06_encrypt_2_different_texts_should_give_2_different_results():void
	{
		var text1ToEncrypt:String = "Text1";
		var text2ToEncrypt:String = "Text2";
		var encrypted1:String = utCryptoUtilV2.encryptString(text1ToEncrypt);
		var encrypted2:String = utCryptoUtilV2.encryptString(text2ToEncrypt);
		assertFalse("", ObjectUtil.compare(encrypted1, encrypted2) == 0);
	}
	
	[Test]
	public function test07_A_reverse_empty_string_should_return_empty():void
	{
		var textToReverse:String = "";
		var result:String = utCryptoUtilV2.reverseString(textToReverse);
		assertEquals("", result);
	}
	
	[Test]
	public function test07_B_reverse_string_1_should_return_1():void
	{
		var textToReverse:String = "1";
		var result:String = utCryptoUtilV2.reverseString(textToReverse);
		assertEquals("1", result);
	}
	
	[Test]
	public function test07_C_reverse_abc_should_return_cba_char():void
	{
		var textToReverse:String = "abc";
		var result:String = utCryptoUtilV2.reverseString(textToReverse);
		assertEquals("cba", result);
	}
	
	[Test]
	public function test07_D_reverse_null_should_return_null():void
	{
		var textToReverse:String = null;
		var result:String = utCryptoUtilV2.reverseString(textToReverse);
		assertNull(result);
	}
	
	[Test]
	public function test08_encrypted_should_be_different_than_original_externalizable():void
	{
		var externalizableToEncrypt:ExternalizableForTest = new ExternalizableForTest(7765,
			CLEAR_TEXT);
		var encrypted:String = utCryptoUtilV2.encryptExternalizable(externalizableToEncrypt);
		assertFalse("", ObjectUtil.compare(externalizableToEncrypt, encrypted) == 0);
	}
	
	[Test]
	public function test09_encrypted_externalizable_then_decrypt_it_should_return_same():void
	{
		var externalizableToEncrypt:ExternalizableForTest = new ExternalizableForTest(7367,
			CLEAR_TEXT);
		var encrypted:String = utCryptoUtilV2.encryptExternalizable(externalizableToEncrypt);
		var decrypted:ExternalizableForTest = utCryptoUtilV2.decryptExternalizable(encrypted, ExternalizableForTest)
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
