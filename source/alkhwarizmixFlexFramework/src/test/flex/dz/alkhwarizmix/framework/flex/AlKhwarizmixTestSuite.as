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
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixCommitRecordListCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixGetRecordListCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixMacroCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixSimpleCommandTestCase;
import dz.alkhwarizmix.framework.flex.controller.AlKhwarizmixWebGetDataCommandTestCase;
import dz.alkhwarizmix.framework.flex.dtos.AlKhwarizmixDTOsToIncludeTestCase;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordListVOTestCase;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordVOTestCase;
import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.EncryptionVOTestCase;
import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.GroupVOTestCase;
import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.UserVOTestCase;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixProxyTestCase;
import dz.alkhwarizmix.framework.flex.model.AlKhwarizmixSuperProxyTestCase;
import dz.alkhwarizmix.framework.flex.model.vo.AlKhwarizmixVOTestCase;
import dz.alkhwarizmix.framework.flex.modules.AlKhwarizmixModuleTestCase;
import dz.alkhwarizmix.framework.flex.resources.AlKhwarizmixResourceManagerTestCase;
import dz.alkhwarizmix.framework.flex.rpc.remoting.AlKhwarizmixRemoteObjectTestCase;
import dz.alkhwarizmix.framework.flex.utils.CryptoUtilFactoryTestCase;
import dz.alkhwarizmix.framework.flex.utils.CryptoUtilTestCase;
import dz.alkhwarizmix.framework.flex.utils.CryptoUtilV2TestCase;
import dz.alkhwarizmix.framework.flex.utils.CryptoUtilV3TestCase;
import dz.alkhwarizmix.framework.flex.view.AlKhwarizmixMediatorTestCase;
import dz.alkhwarizmix.framework.flex.view.AlkhwarizmixDataListMediatorTestCase;
import dz.alkhwarizmix.framework.flex.view.components.AlKhwarizmixDataEditFormCanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.components.AlKhwarizmixDataListCanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.components.AlKhwarizmixImageTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixCanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixMDICanvasTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixMDIWindowTestCase;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixVBoxTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixButtonTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixCheckBoxTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixDataGridTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixLabelTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixMenuBarTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixTextAreaTestCase;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixTextInputTestCase;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class AlKhwarizmixTestSuite
{
	// controller
	public var alKhwarizmixBlazeDSGetDataCommandTestCase:AlKhwarizmixBlazeDSGetDataCommandTestCase;
	public var alKhwarizmixMacroCommandTestCase:AlKhwarizmixMacroCommandTestCase;
	public var alKhwarizmixSimpleCommandTestCase:AlKhwarizmixSimpleCommandTestCase;
	public var alKhwarizmixWebGetDataCommandTestCase:AlKhwarizmixWebGetDataCommandTestCase;
	public var alKhwarizmixGetRecordListCommandTestCase:AlKhwarizmixGetRecordListCommandTestCase;
	public var alKhwarizmixCommitRecordListCommandTestCase:AlKhwarizmixCommitRecordListCommandTestCase;
	
	// dtos
	public var recordVOTestCase:RecordVOTestCase;
	public var recordListVOTestCase:RecordListVOTestCase;
	public var alKhwarizmixDTOsToIncludeTestCase:AlKhwarizmixDTOsToIncludeTestCase;
	public var userVOTestCase:UserVOTestCase;
	public var groupVOTestCase:GroupVOTestCase;
	public var encryptionVOTestCase:EncryptionVOTestCase;
	
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
	public var cryptoUtilV2TestCase:CryptoUtilV2TestCase;
	public var cryptoUtilV3TestCase:CryptoUtilV3TestCase;
	public var cryptoUtilFactoryTestCase:CryptoUtilFactoryTestCase;
	
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
	public var alKhwarizmixImageTestCase:AlKhwarizmixImageTestCase;
	public var alKhwarizmixTextAreaTestCase:AlKhwarizmixTextAreaTestCase;
	public var alKhwarizmixDataEditFormCanvasTestCase:AlKhwarizmixDataEditFormCanvasTestCase;
	
} // class
} // package
