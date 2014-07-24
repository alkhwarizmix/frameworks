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

package dz.alkhwarizmix.framework.flex.view.components
{

import spark.components.Image;

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
 *  @since  ٢٢ رمضان ١٤٣٥ (July 20, 2014)
 */
public class AlKhwarizmixImage extends Image
	implements IAlKhwarizmixLocalizable
{
	include "../../../../../../../../templates/flex/core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The Logger
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(AlKhwarizmixImage);
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 */
	public function AlKhwarizmixImage()
	{
		super();
		
		new AlKhwarizmixResourceManager().registerLocalizable(this);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables: Invalidation
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @private
	 *  Whether this component needs to have its
	 *  commitSource() method called.
	 */
	private var invalidateSourceFlag:Boolean = false;
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger
	{
		return LOG;
	}
	
	//----------------------------------
	//  sourceResKey
	//----------------------------------
	
	private var _sourceResKey:String = null;
	public function get sourceResKey():String { return _sourceResKey; }
	
	public function set sourceResKey(value:String):void
	{
		if (_sourceResKey == value)
			return;
		_sourceResKey = value;
		invalidateSource();
	}
	
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
		invalidateSource();
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
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	override protected function commitProperties():void
	{
		validateSource();
		
		super.commitProperties();
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of commitSource
	 */
	public function commitSource():void
	{
		/*if (sourceResKey)
		source = localize(sourceResKey);*/
	}
	
	/**
	 * TODO: ASDOC Definition of invalidateSource
	 */
	public function invalidateSource():void
	{
		if (!invalidateSourceFlag)
		{
			invalidateSourceFlag = true;
			invalidateProperties();
		}
	}
	
	/**
	 * TODO: ASDOC Definition of validateSource
	 */
	public function validateSource():void
	{
		if (invalidateSourceFlag)
		{
			commitSource();
			invalidateSourceFlag = false;
		}
	}
	
} // Class
} // Package
