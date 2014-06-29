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

package dz.alkhwarizmix.framework.flex
{

import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixBlazeDSGetDataCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixMacroCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixSimpleCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixWebGetDataCommandTestCase;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixProxyTestCase;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixSuperProxyTestCase;
import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVOTestCase;
import dz.alkhwarizmix.framework.flex.modules.AlKhwarizmixModuleTestCase;
import dz.alkhwarizmix.framework.flex.resources.AlKhwarizmixResourceManagerTestCase;
import dz.alkhwarizmix.framework.flex.rpc.remoting.AlKhwarizmixRemoteObjectTestCase;
import dz.alkhwarizmix.framework.flex.utils.CryptoUtilTestCase;
import dz.alkhwarizmix.framework.flex.view.AlKhwarizmixMediatorTestCase;
import dz.alkhwarizmix.framework.flex.view.AlkhwarizmixDataListMediatorTestCase;
import dz.alkhwarizmix.framework.flex.view.components.AlKhwarizmixDataListCanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixCanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixMDICanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixMDIWindowTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixVBoxTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixButtonTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixCheckBoxTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixDataGridTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixLabelTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixMenuBarTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixTextInputTestCase;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class TestSuite
{
	// controller
	public var alKhwarizmixBlazeDSGetDataCommandTestCase:AlKhwarizmixBlazeDSGetDataCommandTestCase;
	public var alKhwarizmixMacroCommandTestCase:AlKhwarizmixMacroCommandTestCase;
	public var alKhwarizmixSimpleCommandTestCase:AlKhwarizmixSimpleCommandTestCase;
	public var alKhwarizmixWebGetDataCommandTestCase:AlKhwarizmixWebGetDataCommandTestCase;
	
	// model
	public var alKhwarizmixVOTestCase:AlKhwarizmixVOTestCase;
	public var alKhwarizmixProxyTestCase:AlKhwarizmixProxyTestCase;
	public var alKhwarizmixSuperProxy:AlKhwarizmixSuperProxyTestCase;
	
	// modules
	public var alKhwarizmixModuleTestCase:AlKhwarizmixModuleTestCase;
	
	// rpc
	public var alKhwarizmixRemoteObjectTestCase:AlKhwarizmixRemoteObjectTestCase;
	
	// resources
	public var alkhwarizmixResourceManagerTestCase:AlKhwarizmixResourceManagerTestCase;
	
	// utils
	public var cryptoUtilTestCase:CryptoUtilTestCase;
	
	// view
	public var alKhwarizmixDataListCanvasTestCase:AlKhwarizmixDataListCanvasTestCase;
	public var alKhwarizmixCanvasTestCase:AlKhwarizmixCanvasTestCase;
	public var alKhwarizmixMDICanvasTestCase:AlKhwarizmixMDICanvasTestCase;
	public var alKhwarizmixMDIWindowTestCase:AlKhwarizmixMDIWindowTestCase;
	public var alKhwarizmixVBoxTestCase:AlKhwarizmixVBoxTestCase;
	public var alKhwarizmixButtonTestCase:AlKhwarizmixButtonTestCase;
	public var alKhwarizmixCheckBoxTestCase:AlKhwarizmixCheckBoxTestCase;
	public var alKhwarizmixDataGridTestCase:AlKhwarizmixDataGridTestCase;
	public var alKhwarizmixLabelTestCase:AlKhwarizmixLabelTestCase;
	public var alKhwarizmixTextInputTestCase:AlKhwarizmixTextInputTestCase;
	public var alkhwarizmixDataListMediatorTestCase:AlkhwarizmixDataListMediatorTestCase;
	public var alKhwarizmixMediatorTestCase:AlKhwarizmixMediatorTestCase;
	public var alKhwarizmixMenuBarTestCase:AlKhwarizmixMenuBarTestCase;
	
} // class
} // package
