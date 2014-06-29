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

package dz.alkhwarizmix.framework.flex.view
{

import spark.modules.Module;

import dz.alkhwarizmix.framework.flex.interfaces.IAlKhwarizmixMediator;
import dz.alkhwarizmix.framework.flex.logging.AlKhwarizmixLog;
import dz.alkhwarizmix.framework.flex.logging.IAlKhwarizmixLogger;

import org.puremvc.as3.multicore.interfaces.IFacade;
import org.puremvc.as3.multicore.interfaces.INotification;
import org.puremvc.as3.multicore.patterns.observer.Notification;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٤ شوال ١٤٣٤ (August 31, 2013)
 */
public class ModuleJunctionMediator extends AlKhwarizmixMediator
	implements IAlKhwarizmixMediator
{
	public 	static const NAME:String = "ModuleJunctionMediator_";
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/ /**
	 * LOG.
	 */
	private static const LOG:IAlKhwarizmixLogger = AlKhwarizmixLog.
		getLogger(ModuleJunctionMediator);
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * Constructor.
	 */
	public function ModuleJunctionMediator(theViewComponent:Object,
		theModuleFacade:IFacade, theModuleListNotificationInterests:Array,
		theModuleName:String = null)
	{
		// LOG is not created yet
		// LOG.debug("ModuleJunctionMediator");
		
		if (theModuleName != null)
		{
			moduleName = theModuleName;
		}
		else
		{
			moduleName = (theViewComponent as Module).name ;
		}
		super(getMediatorName(), theViewComponent);
		
		this.moduleFacade = theModuleFacade;
		this.moduleListNotificationInterests = theModuleListNotificationInterests;
	}
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* FIELDS (PRIVATE)
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * Cast the viewComponent to its actual type.
	 * 
	 * @return the viewComponent cast to Module
	 */
	private function get module():Module
	{
		return viewComponent as Module;
	}
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * Facade of the module what created this mediator.
	 */
	private var moduleFacade:IFacade = null;
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * Set in constructor if needed, created to have more flexibility in using
	 * This class by other components than a Module
	 */
	private var moduleName:String = null;
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * List of the notifactions what interest the module
	 */
	private var moduleListNotificationInterests:Array = null;
	
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	//* METHODS (PUBLIC)
	//* ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * Get the Mediator name.
	 * <P>
	 * Called by the framework to get the name of this
	 * mediator. If there is only one instance, we may
	 * define it in a constant and return it here. If
	 * there are multiple instances, this method must
	 * return the unique name of this instance.</P>
	 * 
	 * @return String the Mediator name
	 */
	override public function getMediatorName():String
	{
		return NAME + moduleName;
	}
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * handleNotification Method TO_ASDoc_DO:
	 */
	override protected function handleNotification_try(notif:INotification):void
	{
		LOG.debug("ModuleJunctionMediator: handleNotification");
		
		var newNote:Notification = new Notification(notif.getName(),
			notif.getBody(), notif.getType());
		// newNote.setSender(note.getSender());
		moduleFacade.notifyObservers(newNote);
	}
	
	 /* ****** ***** ***** ***** ***** ***** ***** ***** ***** ***** ******/  /**
	 * listNotificationInterests Method TO_ASDoc_DO:
	 */
	override public function listNotificationInterests():Array
	{
		return moduleListNotificationInterests;
	}
	
} // class
} // package
