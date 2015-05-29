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

package dz.alkhwarizmix.framework.flex.view.components
{

import flash.display.DisplayObject;
import flash.events.ContextMenuEvent;
import flash.events.MouseEvent;
import flash.ui.ContextMenu;
import flash.ui.ContextMenuItem;

import mx.collections.ArrayCollection;
import mx.core.FlexGlobals;
import mx.managers.PopUpManager;

import spark.components.TitleWindow;

import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.view.containers.AlKhwarizmixCanvas;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixButton;
import dz.alkhwarizmix.framework.flex.view.controls.AlKhwarizmixDataGrid;

import flexlib.mdi.containers.MDIWindow;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class AlKhwarizmixDataListCanvas extends AlKhwarizmixCanvas
{
	include "../../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixDataListCanvas()
	{
		super();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	private static var LOG:IAlKhwarizmixLogger = null;
	
	override protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixDataListCanvas);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of dataGrid
	 */
	private var dataGrid:AlKhwarizmixDataGrid = null;
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  dataProvider
	//----------------------------------
	
	private var _dataProvider:ArrayCollection = null;
	public function get dataProvider():ArrayCollection { return _dataProvider; }
	
	public function set dataProvider(value:ArrayCollection):void
	{
		if (_dataProvider == value)
			return;
		
		_dataProvider = value;
		if (dataGrid)
			dataGrid.dataProvider = _dataProvider
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @inheritDoc
	 */
	override protected function createChildren():void
	{
		super.createChildren();
		
		createDataGrid();
		addContextMenu();
	}
	
	/**
	 * @private
	 */
	private function createDataGrid():void
	{
		if (dataGrid == null)
		{
			dataGrid = new AlKhwarizmixDataGrid();
			dataGrid.percentWidth = 100;
			dataGrid.percentHeight = 100;
			dataGrid.dataProvider = dataProvider;
			addElement(dataGrid);
		}
	}
	
	/**
	 * @inheritDoc
	 */
	override protected function updateDisplayList(
		unscaledWidth:Number, unscaledHeight:Number):void
	{
		super.updateDisplayList(unscaledWidth, unscaledHeight);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private function addContextMenu():void
	{
		var defaultContextMenu:ContextMenu = new ContextMenu();
		defaultContextMenu.hideBuiltInItems();
		
		for each (var menuCaption:String in getContextMenuItems())
		{
			var contextMenuItem:ContextMenuItem = new ContextMenuItem(menuCaption);
			contextMenuItem.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT, contextMenuItemSelectHandler);
			defaultContextMenu.customItems.push(contextMenuItem);
		}
		
		this.contextMenu = defaultContextMenu;
	}
	
	/**
	 * TODO: ASDOC
	 */
	protected function getContextMenuItems():Array
	{
		return [
			"كونتاكست مونيو",
			"CONTEXT_MENU_LABEL_CAPTION"
		];
	}
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private function contextMenuItemSelectHandler(event:ContextMenuEvent):void
	{
		var win:MDIWindow = event.contextMenuOwner as MDIWindow;
		handleContextMenuItemSelected(event.target.caption);
	}
	
	/**
	 * TODO: ASDOC
	 */
	protected function handleContextMenuItemSelected(caption:String):void
	{
		switch (caption)
		{
			case ("CONTEXT_MENU_LABEL_CAPTION"):
			{
				showAlert("CONTEXT_MENU_LABEL_CAPTION");
				break;
			}
				
			case ("كونتاكست مونيو"):
			{
				showAlert("كونتاكست مونيو");
				break;
			}
		}
	}
	
	/**
	 * 
	 */
	private function showAlert(message:String):void
	{
		var alertTitleWindow:TitleWindow = new TitleWindow();
		alertTitleWindow.title = message;
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
	
} // Class
} // Package
