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

package dz.alkhwarizmix.winrak.flex
{

import dz.alkhwarizmix.winrak.flex.controller.WinrakAddGeolocationCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakConnectCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakGetCustomizedDataCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakLoginCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakLogoutCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakSetCustomizedDataCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakStartupCommandTestCase;
import dz.alkhwarizmix.winrak.flex.controller.WinrakSubscribeCommandTestCase;
import dz.alkhwarizmix.winrak.flex.model.GeolocationProxyTestCase;
import dz.alkhwarizmix.winrak.flex.model.vo.GeolocationListVOTestCase;
import dz.alkhwarizmix.winrak.flex.model.vo.GeolocationVOTestCase;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class WinrakTestSuite
{
	// public var moqawalatiFlexTestCase:MoqawalatiFlexTestCase;
	// public var moqawalatiConstantsTestCase:MoqawalatiConstantsTestCase;
	// public var moqawalatiErrorTestCase:MoqawalatiErrorTestCase;
	
	// facade
	// public var moqawalatiMainFacadeTestCase:MoqawalatiMainFacadeTestCase;
	
	// controller
	public var winrakAddGeolocationCommandTestCase:WinrakAddGeolocationCommandTestCase;
	public var winrakConnectCommandTestCase:WinrakConnectCommandTestCase;
	public var winrakGetCustomizedDataCommandTestCase:WinrakGetCustomizedDataCommandTestCase;
	public var winrakLoginCommandTestCase:WinrakLoginCommandTestCase;
	public var winrakLogoutCommandTestCase:WinrakLogoutCommandTestCase;
	public var winrakSetCustomizedDataCommandTestCase:WinrakSetCustomizedDataCommandTestCase;
	public var winrakStartupCommandTestCase:WinrakStartupCommandTestCase;
	public var winrakSubscribeCommandTestCase:WinrakSubscribeCommandTestCase;
	
	// event
	// public var moqawalatiEventTestCase:MoqawalatiEventTestCase;
	
	// model
	public var geolocationVOTestCase:GeolocationVOTestCase;
	public var geolocationListVOTestCase:GeolocationListVOTestCase;
	public var geolocationProxyTestCase:GeolocationProxyTestCase;
	
	// dtos
	// public var moqawalatiDTOsToIncludeTestCase:MoqawalatiDTOsToIncludeTestCase;
	
	// resources
	// public var moqawalatiResourceManagerTestCase:MoqawalatiResourceManagerTestCase;
	
	// view
	// public var moqawalatiHBoxTestCase:MoqawalatiHBoxTestCase;
	
	// view.components
	// public var loginBoxEventTestCase:LoginBoxEventTestCase;
	
	// view.containers
	// public var testAndDebugWindowTestCase:TestAndDebugWindowTestCase;
	
} // class
} // package
