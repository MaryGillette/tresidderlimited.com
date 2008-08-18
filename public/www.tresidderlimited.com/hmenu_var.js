/***********************************************************************************
*	(c) Ger Versluis 2000 version 5.411 24 December 2001 (updated Jan 31st, 2003 by Dynamic Drive for Opera7)
*	For info write to menus@burmees.nl		          *
*	You may remove all comments for faster loading	          *		
***********************************************************************************/

	var NoOffFirstLineMenus=5;			// Number of first level items
	var LowBgColor='#004700';			// Background color when mouse is not over
	var LowSubBgColor='#efefef';			// Background color when mouse is not over on subs
	var HighBgColor='#678678';			// Background color when mouse is over
	var HighSubBgColor='#678678';			// Background color when mouse is over on subs
	var FontLowColor='white';			// Font color when mouse is not over
	var FontSubLowColor='116432';			// Font color subs when mouse is not over
	var FontHighColor='black';			// Font color when mouse is over
	var FontSubHighColor='black';			// Font color subs when mouse is over
	var BorderColor='#004700';			// Border color
	var BorderSubColor='#101010';			// Border color for subs
	var BorderWidth=2;				// Border width
	var BorderBtwnElmnts=1;			// Border between elements 1 or 0
	var FontFamily="arial,comic sans ms,technical"	// Font family menu items
	var FontSize=9;				// Font size menu items
	var FontBold=1;				// Bold menu items 1 or 0
	var FontItalic=0;				// Italic menu items 1 or 0
	var MenuTextCentered='left';			// Item text position 'left', 'center' or 'right'
	var MenuCentered='left';			// Menu horizontal position 'left', 'center' or 'right'
	var MenuVerticalCentered='top';		// Menu vertical position 'top', 'middle','bottom' or static
	var ChildOverlap=.2;				// horizontal overlap child/ parent
	var ChildVerticalOverlap=.2;			// vertical overlap child/ parent
	var StartTop=145;				// Menu offset x coordinate
	var StartLeft=10;				// Menu offset y coordinate
	var VerCorrect=0;				// Multiple frames y correction
	var HorCorrect=0;				// Multiple frames x correction
	var LeftPaddng=10;				// Left padding
	var TopPaddng=5;				// Top padding
	var FirstLineHorizontal=1;			// SET TO 1 FOR HORIZONTAL MENU, 0 FOR VERTICAL
	var MenuFramesVertical=0;			// Frames in cols or rows 1 or 0
	var DissapearDelay=100;			// delay before menu folds in
	var TakeOverBgColor=1;			// Menu frame takes over background color subitem frame
	var FirstLineFrame='top';			// Frame where first level appears
	var SecLineFrame='top';			// Frame where sub levels appear
	var DocTargetFrame='mainframe';			// Frame where target documents appear
	var TargetLoc='';				// span id for relative positioning
	var HideTop=1;				// Hide first level when loading new document 1 or 0
	var MenuWrap=0;				// enables/ disables menu wrap 1 or 0
	var RightToLeft=0;				// enables/ disables right to left unfold 1 or 0
	var UnfoldsOnClick=0;			// Level 1 unfolds onclick/ onmouseover
	var WebMasterCheck=0;			// menu tree checking on or off 1 or 0
	var ShowArrow=0;				// Uses arrow gifs when 1
	var KeepHilite=0;				// Keep selected path highligthed
	var Arrws=['tri.gif',5,10,'tridown.gif',10,5,'trileft.gif',5,10];	// Arrow source, width and height

function BeforeStart(){return}
function AfterBuild(){return}
function BeforeFirstOpen(){return}
function AfterCloseAll(){return}


// Menu tree
//	MenuX=new Array(Text to show, Link, background image (optional), number of sub elements, height, width);
//	For rollover images set "Text to show" to:  "rollover:Image1.jpg:Image2.jpg"

Menu1=new Array("Home","hmainframe.htm","",0,25,120);

Menu2=new Array("Products","products.htm","",4,25,120);
	Menu2_1=new Array("Product Overview","products.htm","",0,25,200);
	Menu2_2=new Array("MBS Great Plains","mbs_gpMain.htm","",4,25,200);	
		Menu2_2_1=new Array("Great Plains Professional","mbs_gpPro.htm","",0,25,200);
		Menu2_2_2=new Array("Great Plains Standard","mbs_gpStd.htm","",0,25,200);
		Menu2_2_3=new Array("FRx Analytics","frx.htm","",0,25,200);
		Menu2_2_4=new Array("Add-Ons","GP_adprod.htm","",0,25,200);
	Menu2_3=new Array("MBS Small Business Financials","MBS_SBF.htm","",0,25,200);
	Menu2_4=new Array("Other Products","prod_other.htm","",4,25,150);
		Menu2_4_1=new Array("Solomon","prod_solomon.htm","",0,25,150);
		Menu2_4_2=new Array("Navision","prod_navision.htm","",0,25,150);
		Menu2_4_3=new Array("Axapta","prod_axapta.htm","",0,25,150);
		Menu2_4_4=new Array("Microsoft CRM","prod_CRM.htm","",0,25,150);

Menu3=new Array("Services","services.htm","",3,25,120);
	Menu3_1=new Array("Consulting","services.htm","",0,25,150);
	Menu3_2=new Array("Updates","services.htm","",0,25,150);
	Menu3_3=new Array("Migrations","services.htm","",0,25,150);

Menu4=new Array("About Us","about.htm","",0,25,120);

Menu5=new Array("Contact","contact.htm","",0,25,120);
	