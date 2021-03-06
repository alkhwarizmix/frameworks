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

package dz.alkhwarizmix.moqawalati.flex
{

import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiBlazeDSGetDataCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiCommitRecordListCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiGetCustomizedDataCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiGetRecordListCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiLoginCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiLogoutCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiSetCustomizedDataCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiSimpleCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiStartupCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.controller.MoqawalatiWebGetDataCommandTestCase;
import dz.alkhwarizmix.moqawalati.flex.errors.MoqawalatiErrorTestCase;
import dz.alkhwarizmix.moqawalati.flex.event.MoqawalatiEventTestCase;
import dz.alkhwarizmix.moqawalati.flex.facade.MoqawalatiFacadeTestCase;
import dz.alkhwarizmix.moqawalati.flex.messaging.MoqawalatiConsumerTestCase;
import dz.alkhwarizmix.moqawalati.flex.messaging.MoqawalatiProducerTestCase;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiConfigProxyTestCase;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiLoginUserProxyTestCase;
import dz.alkhwarizmix.moqawalati.flex.model.MoqawalatiProxyTestCase;
import dz.alkhwarizmix.moqawalati.flex.model.vo.MoqawalatiVOTestCase;
import dz.alkhwarizmix.moqawalati.flex.resources.MoqawalatiResourceManagerTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.LoginBoxMediatorTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.MDICanvasMediatorTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.MainCanvasMediatorTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.MainControlBarMediatorTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.MainControlBarTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.MoqawalatiModuleMediatorTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.components.MoqawalatiDataEditFormCanvasTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.components.MoqawalatiDataListCanvasTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.components.MoqawalatiImageTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.components.login.LoginBoxEventTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.components.login.LoginBoxTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MainCanvasTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MainControlBarEventTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiCanvasTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiHBoxTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiMDICanvasTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiMDIWindowTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiVBoxTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.TestAndDebugWindowTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.messagelist.MessageListTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.containers.messagelist.MessageRendererTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.controls.MoqawalatiButtonTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.controls.MoqawalatiCheckBoxTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.controls.MoqawalatiLabelTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.controls.MoqawalatiMenuBarTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.controls.MoqawalatiTextAreaTestCase;
import dz.alkhwarizmix.moqawalati.flex.view.controls.MoqawalatiTextInputTestCase;

[Suite]
[RunWith("org.flexunit.runners.Suite")]
public class Moqawalati1TestSuite
{
	public var moqawalatiConstantsTestCase:MoqawalatiConstantsTestCase;
	public var moqawalatiErrorTestCase:MoqawalatiErrorTestCase;
	
	// facade
	public var moqawalatiFacadeTestCase:MoqawalatiFacadeTestCase;
	
	// messaging
	public var moqawalatiConsumerTestCase:MoqawalatiConsumerTestCase;
	public var moqawalatiProducerTestCase:MoqawalatiProducerTestCase;
	
	// controller
	public var moqawalatiBlazeDSGetDataCommandTestCase:MoqawalatiBlazeDSGetDataCommandTestCase;
	public var moqawalatiGetCustomizedDataCommandTestCase:MoqawalatiGetCustomizedDataCommandTestCase;
	public var moqawalatiSetCustomizedDataCommandTestCase:MoqawalatiSetCustomizedDataCommandTestCase;
	public var moqawalatiStartupCommandTestCase:MoqawalatiStartupCommandTestCase;
	public var moqawalatiLoginCommandTestCase:MoqawalatiLoginCommandTestCase;
	public var moqawalatiLogoutCommandTestCase:MoqawalatiLogoutCommandTestCase;
	public var moqawalatiWebGetDataCommandTestCase:MoqawalatiWebGetDataCommandTestCase;
	public var moqawalatiSimpleCommandTestCase:MoqawalatiSimpleCommandTestCase;
	public var moqawalatiGetRecordListCommandTestCase:MoqawalatiGetRecordListCommandTestCase;
	public var moqawalatiCommitRecordListCommandTestCase:MoqawalatiCommitRecordListCommandTestCase;
	
	// event
	public var moqawalatiEventTestCase:MoqawalatiEventTestCase;
	
	// model
	public var moqawalatiConfigProxyTestCase:MoqawalatiConfigProxyTestCase;
	public var moqawalatiLoginUserProxyTestCase:MoqawalatiLoginUserProxyTestCase;
	public var moqawalatiMDICanvasTestCase:MoqawalatiMDICanvasTestCase;
	public var moqawalatiProxyTestCase:MoqawalatiProxyTestCase;
	
	// dtos
	public var moqawalatiVOTestCase:MoqawalatiVOTestCase;
	
	// resources
	public var moqawalatiResourceManagerTestCase:MoqawalatiResourceManagerTestCase;
	
	// view
	public var moqawalatiHBoxTestCase:MoqawalatiHBoxTestCase;
	public var mainControlBarTestCase:MainControlBarTestCase;
	public var moqawalatiDataListCanvasTestCase:MoqawalatiDataListCanvasTestCase;
	public var loginBoxTestCase:LoginBoxTestCase;
	public var loginBoxMediatorTestCase:LoginBoxMediatorTestCase;
	public var moqawalatiButtonTestCase:MoqawalatiButtonTestCase;
	public var moqawalatiTextInputTestCase:MoqawalatiTextInputTestCase;
	public var moqawalatiCheckBoxTestCase:MoqawalatiCheckBoxTestCase;
	public var moqawalatiLabelTestCase:MoqawalatiLabelTestCase;
	public var moqawalatiMenuBarTestCase:MoqawalatiMenuBarTestCase;
	public var mdiCanvasMediatorTestCase:MDICanvasMediatorTestCase;
	public var mainControlBarMediatorTestCase:MainControlBarMediatorTestCase;
	public var moqawalatiTextAreaTestCase:MoqawalatiTextAreaTestCase;
	public var mainCanvasMediatorTestCase:MainCanvasMediatorTestCase;
	public var moqawalatiModuleMediatorTestCase:MoqawalatiModuleMediatorTestCase;
	public var moqawalatiDataEditFormCanvasTestCase:MoqawalatiDataEditFormCanvasTestCase;
	
	// view.components
	public var loginBoxEventTestCase:LoginBoxEventTestCase;
	public var moqawalatiImageTestCase:MoqawalatiImageTestCase;
	
	// view.containers
	public var testAndDebugWindowTestCase:TestAndDebugWindowTestCase;
	public var mainCanvasTestCase:MainCanvasTestCase;
	public var mainControlBarEventTestCase:MainControlBarEventTestCase;
	public var moqawalatiMDIWindowTestCase:MoqawalatiMDIWindowTestCase;
	public var moqawalatiCanvasTestCase:MoqawalatiCanvasTestCase;
	public var moqawalatiVBoxTestCase:MoqawalatiVBoxTestCase;
	public var messageListTestCase:MessageListTestCase;
	public var messageRendererTestCase:MessageRendererTestCase;
	
} // class
} // package
