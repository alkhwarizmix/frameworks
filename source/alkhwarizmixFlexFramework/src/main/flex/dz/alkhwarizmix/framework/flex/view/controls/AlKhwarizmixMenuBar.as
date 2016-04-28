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

package dz.alkhwarizmix.framework.flex.view.controls
{

import mx.controls.MenuBar;

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixLocalizable;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;
import dz.alkhwarizmix.framework.flex.resources.AlKhwarizmixResourceManager;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٧ رجب ١٤٣٥ (May 26, 2014)
 */
public class AlKhwarizmixMenuBar extends MenuBar
	implements IAlKhwarizmixLocalizable
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
	public function AlKhwarizmixMenuBar()
	{
		super();
		
		new AlKhwarizmixResourceManager().registerLocalizable(this);
		
		if (AlKhwarizmixLog.isLogLevelAll)
			logger.debug(AlKhwarizmixLog.CONSTRUCTOR);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Logger
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The Logger
	 */
	private static var LOG:IAlKhwarizmixLogger = null;
	
	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger
	{
		if (!LOG)
			LOG = AlKhwarizmixLog.getLogger(AlKhwarizmixMenuBar);
		return LOG;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables: Invalidation
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @private
	 *  Whether this component needs to have its
	 *  commitLabels() method called.
	 */
	private var invalidateLabelsFlag:Boolean = true;
	
	//--------------------------------------------------------------------------
	//
	//  Overridden properties
	//
	//--------------------------------------------------------------------------
	
	private var _originalDataProvider:Object = null;
	
	/**
	 *  @inheritDoc
	 */
	override public function get dataProvider():Object
	{
		return super.dataProvider;
	}
	override public function set dataProvider(value:Object):void
	{
		if (_originalDataProvider == value)
			return;
		_originalDataProvider = value;
		invalidateLabels();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  localize
	//----------------------------------
	
	private var _localize:Function;
	[Bindable]
	public function get localize():Function { return _localize; }
	
	public function set localize(value:Function):void
	{
		if (_localize == value)
			return;
		_localize = value;
		invalidateLabels();
	}
	
	//----------------------------------
	//  resourceBundleName
	//----------------------------------
	
	public function get resourceBundleName():String
	{
		return null;
	}
	
	//----------------------------------
	//  resourceKeyPath
	//----------------------------------
	
	public function get resourceKeyPath():String
	{
		return "dz.alkhwarizmix.i18n.";
	}
	//--------------------------------------------------------------------------
	//
	//  Overridden methods
	//
	//--------------------------------------------------------------------------
	
	override protected function commitProperties():void
	{
		validateLabels();
		
		super.commitProperties();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of commitLabels
	 */
	public function commitLabels():void
	{
		var localizedDataProvider:XML = new XML(_originalDataProvider);
		localizeXMLMenuItemsLabel(localizedDataProvider);
		super.dataProvider = localizedDataProvider;
	}
	
	/**
	 * TODO: ASDOC Definition of localizeXMLLabels
	 */
	private function localizeXMLMenuItemsLabel(xml:XML):void
	{
		for each (var x:XML in xml.menuitem)
		{
			x.@label = localize(x.@label);
			localizeXMLMenuItemsLabel(x);
		}
	}
	
	/**
	 * TODO: ASDOC Definition of invalidateLabels
	 */
	public function invalidateLabels():void
	{
		if (!invalidateLabelsFlag)
		{
			invalidateLabelsFlag = true;
			invalidateProperties();
		}
	}
	
	/**
	 * TODO: ASDOC Definition of validateLabels
	 */
	public function validateLabels():void
	{
		if (invalidateLabelsFlag)
		{
			commitLabels();
			invalidateLabelsFlag = false;
		}
	}
	
} // Class
} // Package
