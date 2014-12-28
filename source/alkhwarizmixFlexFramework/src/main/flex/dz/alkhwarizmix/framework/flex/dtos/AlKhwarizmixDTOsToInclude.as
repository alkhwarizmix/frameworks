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

package dz.alkhwarizmix.framework.flex.dtos
{

import flash.utils.Dictionary;

import dz.alkhwarizmix.framework.flex.dtos.customize.model.vo.CustomDataVO;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordListVO;
import dz.alkhwarizmix.framework.flex.dtos.record.model.vo.RecordVO;
import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.EncryptionVO;
import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.GroupVO;
import dz.alkhwarizmix.framework.flex.dtos.security.model.vo.UserVO;

/**
 *  <p>
 *  TODO: ASDOC
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ١٩ محرم ١٤٣٥ (November 23, 2013)
 */
public class AlKhwarizmixDTOsToInclude
{
	private var registeredClassesInstances:Dictionary = null;
	
	public function AlKhwarizmixDTOsToInclude()
	{
		registerNeededClasses();
	}
	
	/**
	 * TODO: ASDOC Definition of registerNeededClasses
	 */
	protected function registerNeededClasses():void
	{
		registeredClassesInstances = new Dictionary(false);
		
		registerClass(UserVO);
		registerClass(GroupVO);
		registerClass(EncryptionVO);
		
		registerClass(CustomDataVO);
		registerClass(RecordVO);
		registerClass(RecordListVO);
	}
	
	public function registerClass(clazz:Class):void
	{
		registeredClassesInstances[clazz] = new clazz();
	}
	
	public function isClassRegistered(clazz:Class):Boolean
	{
		return (registeredClassesInstances[clazz] != null)
	}
	
} // Class
} // Package
