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

import flash.display.DisplayObject;
import flash.events.MouseEvent;

import mx.core.FlexGlobals;
import mx.managers.PopUpManager;

import spark.components.TitleWindow;

import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixButton;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٧ شوال ١٤٣٦ (August 12, 2015)
 */
public class AlertUtil
{
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlertUtil()
	{
		// NOOP
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * 
	 */
	public final function showAlert(title:String, message:String = ""):void
	{
		var alertTitleWindow:TitleWindow = new TitleWindow();
		alertTitleWindow.title = title + message;
		alertTitleWindow.width= 220;
		alertTitleWindow.height= 150;
		populateWindow(alertTitleWindow);
		var alertParent:DisplayObject = FlexGlobals.topLevelApplication as DisplayObject;
		PopUpManager.addPopUp(alertTitleWindow, alertParent, true);
		PopUpManager.centerPopUp(alertTitleWindow);
	}
	
	/**
	 * 
	 */
	private function populateWindow(titleWindow:TitleWindow):void
	{
		var btnClose:AlKhwarizmixButton = new AlKhwarizmixButton();
		btnClose.label="close";
		btnClose.addEventListener(MouseEvent.CLICK,
			function (event:MouseEvent):void
			{
				PopUpManager.removePopUp(titleWindow);
			});
		titleWindow.addElement(btnClose);   
	}
	
} // class
} // package
