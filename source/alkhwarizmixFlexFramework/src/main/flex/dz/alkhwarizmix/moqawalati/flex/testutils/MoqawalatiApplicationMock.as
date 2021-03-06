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

package dz.alkhwarizmix.moqawalati.flex.testutils
{

import dz.alkhwarizmix.moqawalati.flex.interfaces.IMoqawalatiApplication;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiCanvas;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MoqawalatiHBox;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MainControlBar;
import dz.alkhwarizmix.moqawalati.flex.view.containers.MainCanvas;

/**
 *  <p>
 *  Test for MoqawalatiWebGetDataCommand
 *  </p>
 * 
 *  @author فارس بلحواس (Fares Belhaouas)
 *  @since  ٢٦ جمادى الثانية ١٤٣٥ (April 26, 2014)
 */
public class MoqawalatiApplicationMock
	implements IMoqawalatiApplication
{
	public function get parameters():Object
	{
		return {};
	}
	
	public function get mainCanvas():MoqawalatiCanvas
	{
		return new MainCanvas();
	}
	
	public function get mainControlBar():MoqawalatiHBox
	{
		return new MainControlBar();
	}
	
} // class
} // package
