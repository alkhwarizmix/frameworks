////////////////////////////////////////////////////////////////////////////////
//  بسم الله الرحمن الرحيم
//
//  حقوق التأليف والنشر ١٤٣٥ هجري، فارس بلحواس (Copyright 2013 Fares Belhaouas)  
//  كافة الحقوق محفوظة (All Rights Reserved)
//
//  NOTICE: Fares Belhaouas permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package dz.alkhwarizmix.templates.flex
{

import dz.alkhwarizmix.framework.flex.errors.AlKhwarizmixMissingImplError;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

import flash.events.MouseEvent;

import mx.core.UIComponent;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٦ شوال ١٤٣٤ (August 22, 2013)
 *  @since  ٢٢ ذو الحجة ١٤٣٤ (October 27, 2013)
 */
public class AlKhwarizmixComponentAS extends UIComponent
	implements IAlKhwarizmixInterface
{
	include "./core/Version.as";
	
	//--------------------------------------------------------------------------
	//
	//  Constants
	//
	//--------------------------------------------------------------------------
	
	/**
	 * The Logger
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(AlKhwarizmixComponent);
	
	//--------------------------------------------------------------------------
	//
	//  Class variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of classVariable1
	 */
	public static var classVariable1:AlKhwarizmixComponent = null;
	
	//--------------------------------------------------------------------------
	//
	//  Class properties
	//
	//--------------------------------------------------------------------------
	
	// TBD
	
	//--------------------------------------------------------------------------
	//
	//  Class methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of staticPublicMethod1
	 */
	public static function staticPublicMethod1():void
	{
	}
	
	//--------------------------------------------------------------------------
	//
	//  Constructor
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  Constructor.
	 *
	 *  @param arg1 Definition of arg1.
	 *  @param arg2Long Definition of arg2.
	 */
	public function AlKhwarizmixComponentAS(arg1:*="", arg2Long:*=0)
	{
		// NOOP
	}
	
	//--------------------------------------------------------------------------
	//
	//  Variables
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of variable1
	 */
	public var variable1:AlKhwarizmixComponent = null;
	
	//--------------------------------------------------------------------------
	//
	//  Variables: Invalidation
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @private
	 *  Whether this component needs to have its
	 *  commitProperties() method called.
	 */
	private var invalidatePropertiesFlag:Boolean = false;
	
	//--------------------------------------------------------------------------
	//
	//  Overriden properties
	//
	//--------------------------------------------------------------------------
	
	/**
	 *  @inheritDoc
	 */
	override public function get inheritedProperty():AlKhwarizmixComponent
	{
		return null;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Properties
	//
	//--------------------------------------------------------------------------
	
	//----------------------------------
	//  log
	//----------------------------------
	
	/**
	 * Returns the specific class log, by default returns a generic log,
	 * should be overrided by inheriting classes
	 */
	protected function get logger():IAlKhwarizmixLogger
	{
		return LOG;
	}
	
	//----------------------------------
	//  propertyWithGetAndSet1
	//----------------------------------
	
	/** @private */
	private var _propertyWithGetAndSet1:String = null;
	
	[Bindable("propertyWithGetAndSet1Changed")]
	/**
	 * TODO: ASDOC Definition of propertyWithGetAndSet1
	 */
	public function get propertyWithGetAndSet1():String { return _propertyWithGetAndSet1; }
	
	/**
	 * @private
	 */
	public function set propertyWithGetAndSet1(value:String):void
	{
		if (_propertyWithGetAndSet1 == value)
			return;
		_propertyWithGetAndSet1 = value;
	}
	
	//----------------------------------
	//  propertyWithGetAndSet2
	//----------------------------------
	
	/** @private */
	private var _propertyWithGetAndSet2:String = null;
	
	/**
	 * TODO: ASDOC Definition of propertyWithGetAndSet2
	 */
	public function get propertyWithGetAndSet2():String { return _propertyWithGetAndSet2; }
	
	/**
	 * @private
	 */
	public function set propertyWithGetAndSet2(value:String):void
	{
		if (_propertyWithGetAndSet2 == value)
			return;
		_propertyWithGetAndSet2 = value;
	}
	
	//--------------------------------------------------------------------------
	//
	//  Overriden methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @inheritDoc
	 */
	override public function inheritedPublicMethod1():void
	{
		// TODO
	}
	
	/**
	 * @inheritDoc
	 */
	override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
	{
		super.updateDisplayList(unscaledWidh, unscaledHeight);
	}
	
	//--------------------------------------------------------------------------
	//
	//  Methods
	//
	//--------------------------------------------------------------------------
	
	/**
	 * TODO: ASDOC Definition of invalidateProperties
	 */
	public function invalidateProperties():void
	{
		if (!invalidatePropertiesFlag)
		{
			invalidatePropertiesFlag = true;
			
			if (nestLevel && UIComponentGlobals.layoutManager)
				UIComponentGlobals.layoutManager.invalidateProperties(this);
		}
	}
	
	public function validateProperties():void
	{
		if (invalidatePropertiesFlag)
		{
			commitProperties();
			
			invalidatePropertiesFlag = false;
		}
	}
	
	/**
	 * TODO: ASDOC Definition of publicAbstractMethod
	 */
	public function publicAbstractMethod():void
	{
		throw new AlKhwarizmixMissingImplError();
	}
	
	/**
	 * TODO: ASDOC Definition of publicMethod1
	 */
	public function publicMethod1():void
	{
		// NOOP
	}
	
	/**
	 * TODO: ASDOC Definition of protectedMethod2
	 */
	protected function protectedMethod2():void
	{
		// TODO
	}
	
	/**
	 * TODO: ASDOC Definition of privateMethod3
	 */
	private function privateMethod3():void
	{
		// TODO
	}
	
	//--------------------------------------------------------------------------
	//
	//  Event handlers
	//
	//--------------------------------------------------------------------------
	
	/**
	 * @private
	 */
	private function button1_clickHandler(event:MouseEvent):void
	{
		// NOOP
	}
	
} // Class
} // Package