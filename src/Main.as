package
{
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.utils.*;
	
	public class Main extends Sprite
	{
		private var document:HTML;
		private var html:URLLoader;
		private var css:URLLoader;
		
		public function Main()
		{
			super();

			stage.align = "TL";
			stage.scaleMode = "noScale";
			stage.addEventListener( Event.RESIZE, onResize );
			
			html = new URLLoader();
			html.addEventListener(Event.COMPLETE, init);
			html.load( new URLRequest("sample.html") );
			
			css = new URLLoader();
			css.addEventListener(Event.COMPLETE, init);
			css.load( new URLRequest("sample.css") );
		}
		
		private function init( event:Event ):void
		{
			if( html.data != null && css.data != null ) {	
				document = new HTML( stage.stageWidth, stage.stageHeight );
				document.styleSheet = css.data; // "p{ font-family:Arial; font-size:20px; } .column{ width:25%; height:85%; } #header{ background:#FF0; width:100%; height:15%; } #left{ background:#DDD; } #middle{ background:#FFF; width:50%; } #right{ background:#DDD; } #first{ width:200px; height:100px; background:#ABC; x:10; y:10; } .inner{ width:100px; height:100px; background:#DEF; x:10; y:10;}";
				document.innerHTML = html.data; // '<html><div id="header"></div><div id="left" class="column">This is a example of rendering HTML and CSS within Flash with ActionScript 3.</div><div id="middle" class="column"><div id="first"><p>HELLO WORLD!!!!</p></div><div class="inner" /><div class="inner" /><div class="inner" /><div class="inner"/></div><div id="right" class="column"></div></html>';
				addChild( document );
				setup();
			}
		}
		
		private function onResize( event:Event ):void
		{
			document.update( stage.stageWidth, stage.stageHeight );
			setup();
		}
		
		private function setup():void
		{
			var logo:Sprite = document.getElementById("logo");
			logo.addEventListener( MouseEvent.CLICK, onClick );
		}
		
		public function onClick(event:Event):void
		{
			trace("You clicked the logo.");
		}
	}
}