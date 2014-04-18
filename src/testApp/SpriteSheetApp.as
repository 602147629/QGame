package testApp
{
	import com.qgame.core.animation.AnimationManager;
	import com.qgame.core.animation.SpriteSheetMC;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import testApp.spConfig.SPConfig;
	
	public class SpriteSheetApp extends Sprite
	{
		private var _arr:Array;
		
		[Embed(source="../assets/spriteSheet/jsonarrayformat.json",mimeType="application/octet-stream")]
		private var data:Class;
		public function SpriteSheetApp()
		{
			var d:String = new data();
			AnimationManager.instance.addSpriteSheetData("jsonarrayformat",d);
			
			SPConfig.initConfig();
			
			this._arr = [];
			for (var i:int = 0; i < 1; i++) 
			{
				var sp:Sprite = new Sprite();
				var spMC:SpriteSheetMC = new SpriteSheetMC("jsonarrayformat");
				spMC.play("呼吸",1);
				this.addChild(spMC);
				this._arr.push(spMC);
			}
			
			this.addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		protected function onFrame(event:Event):void
		{
			// TODO Auto-generated method stub
			for each (var item:SpriteSheetMC in this._arr) 
			{
				item.update();
			}
			
		}
		
	}
}