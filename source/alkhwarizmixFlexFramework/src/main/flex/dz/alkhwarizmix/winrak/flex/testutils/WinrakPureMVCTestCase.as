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

package dz.alkhwarizmix.winrak.flex.testutils
{

import dz.alkhwarizmix.framework.flex.facade.AlKhwarizmixFacade;
import dz.alkhwarizmix.winrak.flex.WinrakConstants;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakConfigProxy;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakFacade;
import dz.alkhwarizmix.winrak.flex.model.WinrakConfigProxy;

import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.IProxy;
import org.puremvc.as3.multicore.patterns.facade.Facade;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٠٤ شوال ١٤٣٦ (July 20, 2015)
 */
public class WinrakPureMVCTestCase extends WinrakTestCase
{
	private static const TEST_FACADE_NAME:String = "WinrakPureMVCTestCase_TEST_FACADE";
	
	//--------------------------------------------------------------------------
	//
	//  SETUP & TEARDOWN
	//
	//--------------------------------------------------------------------------
	
	override protected function setUp():void
	{
		WinrakSimpleCommandMock.init();
	}
	
	override protected function tearDown():void
	{
		if (Facade.hasCore(WinrakConstants.FACADE_NAME))
			removeFacadeCore(WinrakConstants.FACADE_NAME);
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
	protected final function get winrakMainFacade():IWinrakFacade
	{
		return WinrakFacadeForTest.getInstance(WinrakConstants.FACADE_NAME) as IWinrakFacade;
	}
	
	protected final  function get winrakConfigProxy():IWinrakConfigProxy
	{
		return winrakMainFacade.retrieveProxy(WinrakConfigProxy.NAME)
			as WinrakConfigProxy;
	}
	
	/**
	 * @private
	 */
	protected final function registerWinrakConfigProxy():IProxy
	{
		return registerProxy(WinrakConfigProxy);
	}
	
	/**
	 * @private
	 */
	protected final function removeWinrakConfigProxy():void
	{
		winrakMainFacade.removeProxy(WinrakConfigProxy.NAME);
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
		winrakMainFacade.registerProxy(result);
		return winrakMainFacade.retrieveProxy(result.getProxyName());
	}
	
} // class
} // package

//--------------------------------------------------------------------------

import dz.alkhwarizmix.winrak.flex.facade.WinrakFacade;
import dz.alkhwarizmix.winrak.flex.interfaces.IWinrakFacade;

internal class WinrakFacadeForTest extends WinrakFacade
	implements IWinrakFacade
{
	public static function getInstance(key:String):IWinrakFacade 
	{
		if (instanceMap[key] == null)
			instanceMap[key] = new WinrakFacadeForTest(key);
		
		return instanceMap[key] as IWinrakFacade;
	}
	
	/**
	 *  Constructor.
	 */
	public function WinrakFacadeForTest(key:String)
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
