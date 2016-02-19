/*
 * FCKeditor - The text editor for Internet - http://www.fckeditor.net
 * Copyright (C) 2003-2007 Frederico Caldeira Knabben
 *
 * == BEGIN LICENSE ==
 *
 * Licensed under the terms of any of the following licenses at your
 * choice:
 *
 *  - GNU General Public License Version 2 or later (the "GPL")
 *    http://www.gnu.org/licenses/gpl.html
 *
 *  - GNU Lesser General Public License Version 2.1 or later (the "LGPL")
 *    http://www.gnu.org/licenses/lgpl.html
 *
 *  - Mozilla Public License Version 1.1 or later (the "MPL")
 *    http://www.mozilla.org/MPL/MPL-1.1.html
 *
 * == END LICENSE ==
 *
 * Editor configuration settings.
 *
 * Follow this link for more information:
 * http://wiki.fckeditor.net/Developer%27s_Guide/Configuration/Configurations_Settings
 */

// Disable the custom Enter Key Handler. This option will be removed in version 2.5.
FCKConfig.DisableEnterKeyHandler = false ;

FCKConfig.CustomConfigurationsPath = '' ;

FCKConfig.EditorAreaCSS = FCKConfig.BasePath + '../../../css/fck-main.css' ;
FCKConfig.ToolbarComboPreviewCSS = '' ;

FCKConfig.DocType = '' ;

FCKConfig.BaseHref = '' ;

FCKConfig.FullPage = false ;

FCKConfig.Debug = false ;
FCKConfig.AllowQueryStringDebug = true ;

FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/pulse/' ;
FCKConfig.PreloadImages = [ FCKConfig.SkinPath + 'images/toolbar.start.gif', FCKConfig.SkinPath + 'images/toolbar.buttonarrow.gif' ] ;

FCKConfig.PluginsPath = FCKConfig.BasePath + 'plugins/' ;

// FCKConfig.Plugins.Add( 'autogrow' ) ;
FCKConfig.AutoGrowMax = 400 ;

// FCKConfig.ProtectedSource.Add( /<%[\s\S]*?%>/g ) ;	// ASP style server side code <%...%>
// FCKConfig.ProtectedSource.Add( /<\?[\s\S]*?\?>/g ) ;	// PHP style server side code
// FCKConfig.ProtectedSource.Add( /(<asp:[^\>]+>[\s|\S]*?<\/asp:[^\>]+>)|(<asp:[^\>]+\/>)/gi ) ;	// ASP.Net style tags <asp:control>

FCKConfig.AutoDetectLanguage	= true ;
FCKConfig.DefaultLanguage		= 'en' ;
FCKConfig.ContentLangDirection	= 'ltr' ;

FCKConfig.ProcessHTMLEntities	= false ;
FCKConfig.IncludeLatinEntities	= false ;
FCKConfig.IncludeGreekEntities	= false ;

FCKConfig.ProcessNumericEntities = false ;

FCKConfig.AdditionalNumericEntities = ''  ;		// Single Quote: "'"

FCKConfig.FillEmptyBlocks	= true ;

FCKConfig.FormatSource		= false ;
FCKConfig.FormatOutput		= false ;
FCKConfig.FormatIndentator	= '' ;

FCKConfig.ForceStrongEm = true ;
FCKConfig.GeckoUseSPAN	= false ;
FCKConfig.StartupFocus	= false ;
FCKConfig.ForcePasteAsPlainText	= false ;
FCKConfig.AutoDetectPasteFromWord = true ;	// IE only.
FCKConfig.ForceSimpleAmpersand	= false ;
FCKConfig.TabSpaces		= 0 ;
FCKConfig.ShowBorders	= true ;
FCKConfig.SourcePopup	= false ;

FCKConfig.ToolbarStartExpanded	= true ;
FCKConfig.ToolbarCanCollapse	= true ;
FCKConfig.IgnoreEmptyParagraphValue = true ;
FCKConfig.PreserveSessionOnFileBrowser = false ;
FCKConfig.FloatingPanelsZIndex = 10000 ;

FCKConfig.TemplateReplaceAll = true ;
FCKConfig.TemplateReplaceCheckbox = true ;

FCKConfig.ToolbarLocation = 'In' ;

FCKConfig.ToolbarSets["Default"] = [
	['Source','DocProps','-','Save','NewPage','Preview','-','Templates'],
	['Cut','Copy','Paste','PasteText','PasteWord','-','Print','SpellCheck'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	['Form','Checkbox','Radio','TextField','Textarea','Select','Button','ImageButton','HiddenField'],
	'/',
	['Bold','Italic','Underline','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','Rule','Smiley','SpecialChar','PageBreak'],
	'/',
	['Style','FontFormat','FontName','FontSize'],
	['TextColor','BGColor'],
	['FitWindow','-','About']
] ;

FCKConfig.ToolbarSets["Basic"] = [
	['Bold','Italic','-','OrderedList','UnorderedList','-','Link','Unlink','-','About']
] ;

FCKConfig.EnterMode = 'p' ;			// p | div | br
FCKConfig.ShiftEnterMode = 'br' ;	// p | div | br

FCKConfig.Keystrokes = [
	[ CTRL + 65 /*A*/, true ],
	[ CTRL + 67 /*C*/, true ],
	[ CTRL + 70 /*F*/, true ],
	[ CTRL + 83 /*S*/, true ],
	[ CTRL + 88 /*X*/, true ],
	[ CTRL + 86 /*V*/, 'Paste' ],
	[ SHIFT + 45 /*INS*/, 'Paste' ],
	[ CTRL + 90 /*Z*/, 'Undo' ],
	[ CTRL + 89 /*Y*/, 'Redo' ],
	[ CTRL + SHIFT + 90 /*Z*/, 'Redo' ],
	[ CTRL + 76 /*L*/, 'Link' ],
	[ CTRL + 66 /*B*/, 'Bold' ],
	[ CTRL + 73 /*I*/, 'Italic' ],
	[ CTRL + 85 /*U*/, 'Underline' ],
	[ CTRL + SHIFT + 83 /*S*/, 'Save' ],
	[ CTRL + ALT + 13 /*ENTER*/, 'FitWindow' ],
	[ CTRL + 9 /*TAB*/, 'Source' ]
] ;

FCKConfig.ContextMenu = ['Generic','Link','Anchor','Image','Flash','Select','Textarea','Checkbox','Radio','TextField','HiddenField','ImageButton','Button','BulletedList','NumberedList','Table','Form'] ;

FCKConfig.FontColors = '000000,993300,333300,003300,003366,000080,333399,333333,800000,FF6600,808000,808080,008080,0000FF,666699,808080,FF0000,FF9900,99CC00,339966,33CCCC,3366FF,800080,999999,FF00FF,FFCC00,FFFF00,00FF00,00FFFF,00CCFF,993366,C0C0C0,FF99CC,FFCC99,FFFF99,CCFFCC,CCFFFF,99CCFF,CC99FF,FFFFFF' ;

FCKConfig.FontFormats	= 'p;div;pre;address;h2;h3;h4;h5;h6' ;
FCKConfig.FontNames		= 'Arial;Comic Sans MS;Courier New;Tahoma;Times New Roman;Verdana' ;
FCKConfig.FontSizes		= '1/xx-small;2/x-small;3/small;4/medium;5/large;6/x-large;7/xx-large' ;


FCKConfig.StylesXmlPath		= FCKConfig.EditorPath + 'fckstyles.xml' ;
FCKConfig.TemplatesXmlPath	= FCKConfig.EditorPath + 'fcktemplates.xml' ;

FCKConfig.SpellChecker			= 'ieSpell' ;	// 'ieSpell' | 'SpellerPages'
FCKConfig.IeSpellDownloadUrl	= 'http://www.iespell.com/download.php' ;
FCKConfig.SpellerPagesServerScript = 'server-scripts/spellchecker.php' ;	// Available extension: .php .cfm .pl

FCKConfig.MaxUndoLevels = 15 ;

FCKConfig.DisableObjectResizing = false ;
FCKConfig.DisableFFTableHandles = true ;

FCKConfig.LinkDlgHideTarget		= false ;
FCKConfig.LinkDlgHideAdvanced	= false ;

FCKConfig.ImageDlgHideLink		= false ;
FCKConfig.ImageDlgHideAdvanced	= false ;

FCKConfig.FlashDlgHideAdvanced	= false ;

FCKConfig.ProtectedTags = '' ;

// This will be applied to the body element of the editor
FCKConfig.BodyId = '' ;
FCKConfig.BodyClass = '' ;

FCKConfig.DefaultStyleLabel = '' ;
FCKConfig.DefaultFontFormatLabel = '' ;
FCKConfig.DefaultFontLabel = '' ;
FCKConfig.DefaultFontSizeLabel = '' ;

FCKConfig.DefaultLinkTarget = '' ;

// The option switches between trying to keep the html structure or do the changes so the content looks like it was in Word
FCKConfig.CleanWordKeepsStructure = false ;

// Only inline elements are valid.
FCKConfig.RemoveFormatTags = 'b,big,code,del,dfn,em,font,i,ins,kbd,q,samp,small,span,strike,strong,sub,sup,tt,u,var' ;

FCKConfig.CustomStyles = { };

// Do not add, rename or remove styles here. Only apply definition changes.
FCKConfig.CoreStyles = 
{
	// Basic Inline Styles.
	'Bold'			: { Element : 'strong', Overrides : 'b' },
	'Italic'		: { Element : 'em', Overrides : 'i' },
	'Underline'		: { Element : 'u' },
	'StrikeThrough'	: { Element : 'strike' },
	'Subscript'		: { Element : 'sub' },
	'Superscript'	: { Element : 'sup' },
	
	// Basic Block Styles (Font Format Combo).
	'p'				: { Element : 'p' },
	'div'			: { Element : 'div' },
	'pre'			: { Element : 'pre' },
	'address'		: { Element : 'address' },
	'h1'			: { Element : 'h1' },
	'h2'			: { Element : 'h2' },
	'h3'			: { Element : 'h3' },
	'h4'			: { Element : 'h4' },
	'h5'			: { Element : 'h5' },
	'h6'			: { Element : 'h6' },
	
	// Other formatting features.
	'FontFace' : 
	{ 
		Element		: 'span', 
		Styles		: { 'font-family' : '#("Font")' }, 
		Overrides	: [ { Element : 'font', Attributes : { 'face' : null } } ]
	},
	
	'Size' :
	{ 
		Element		: 'span', 
		Styles		: { 'font-size' : '#("Size","fontSize")' }, 
		Overrides	: [ { Element : 'font', Attributes : { 'size' : null } } ]
	},
	
	'Color' :
	{ 
		Element		: 'span', 
		Styles		: { 'color' : '#("Color","color")' }, 
		Overrides	: [ { Element : 'font', Attributes : { 'color' : null } } ]
	},
	
	'BackColor'		: { Element : 'span', Styles : { 'background-color' : '#("Color","color")' } }
};

// The distance of an indentation step.
FCKConfig.IndentLength = 40 ;
FCKConfig.IndentUnit = 'px' ;

// Alternatively, FCKeditor allows the use of CSS classes for block indentation.
// This overrides the IndentLength/IndentUnit settings.
FCKConfig.IndentClasses = [] ;

// [ Left, Center, Right, Justified ]
FCKConfig.JustifyClasses = [] ;


FCKConfig.ToolbarSets["PulseDefault"] = [
	['Source','Preview','-','Templates','-'],
	['Cut','Copy','Paste','PasteText','PasteWord','-','Print','-'],
	['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
	
	['Bold','Italic','StrikeThrough','-','Subscript','Superscript'],
	['OrderedList','UnorderedList','-','Outdent','Indent'],
	['JustifyLeft','JustifyCenter','JustifyRight','JustifyFull'],
	['Link','Unlink','Anchor'],
	['Image','Flash','Table','SpecialChar'],

	['Style','FontFormat'],
	['TextColor','BGColor'],
	['FitWindow']
] ;




/* 
 * for custom styles use your own fckstyles.xml, other config options
 * can be overriden with "fckconfig.custom.js".
 */

/* ------------------------------------------------------------- */
/* fckconfig.custom.js files will be appended below during build */
/* ------------------------------------------------------------- */

