////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٧ هجري، فارس بلحواس (Copyright 2016 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.framework.flex.testutils
{

import dz.alkhwarizmix.framework.flex.facade.AlKhwarizmixFacade;

import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since ٢٥ ربيع الثاني ١٤٣٧ (January 31, 2016)
 */
public class AlKhwarizmixPureMVCTestCase extends AlKhwarizmixTestCase
{
	private static const TEST_FACADE_NAME:String = "AlKhwarizmixPureMVCTestCase_TEST_FACADE";
	
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		// AlKhwarizmixSimpleCommandMock.init();
	}
	
	override protected function tearDown():void
	{
		if (Facade.hasCore(TEST_FACADE_NAME))
			removeFacadeCore(TEST_FACADE_NAME);
	}
	
	//--------------------------------------------------------------------------
	//
	//  HELPERS
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	protected final function get testFacade():IFacade
	{
		return Facade.getInstance(TEST_FACADE_NAME);
	}
	
	/**
	 * @private
	 */
	protected final function newFacadeCommandClassWithKey(
		facade:AlKhwarizmixFacade, key:String):*
	{
		return new (facade.getCommandClassWithKey(key));
	}
	
	//--------------------------------------------------------------------------
	//
	//  METHODS
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private function registerProxy(proxyClass:Class):IProxy
	{
		var result:IProxy = new proxyClass();
		testFacade.registerProxy(result);
		return testFacade.retrieveProxy(result.getProxyName());
	}
	
} // class
} // package

//--------------------------------------------------------------------------

import dz.alkhwarizmix.framework.flex.facade.AlKhwarizmixFacade;
import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixFacade;

internal class AlKhwarizmixFacadeForTest extends AlKhwarizmixFacade
	implements IAlKhwarizmixFacade
{
	public static function getInstance(key:String):IAlKhwarizmixFacade 
	{
		if (instanceMap[key] == null)
			instanceMap[key] = new AlKhwarizmixFacadeForTest(key);
		
		return instanceMap[key] as IAlKhwarizmixFacade;
	}
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixFacadeForTest(key:String)
	{
		super(key);
	}
	
	override public function startup(app:*):void
	{
		// NOOP
	}
	
	override protected function initCommandsToRegister():void
	{
		// NOOP
	}
	
}

//--------------------------------------------------------------------------
