package testApp
{
	import com.qgame.core.animation.SWFExtraPicMC;
	import com.qgame.core.animation.core.Animation;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import testApp.mcConfig.ActionConfig;
	
	public class MovieClipAPP extends Sprite
	{
		private var _animationArr:Array;
		public function MovieClipAPP()
		{
			this.addEventListener(Event.ADDED_TO_STAGE,onAdded);
		}
		
		protected function onAdded(event:Event):void
		{
			ActionConfig.initMCConfig();
			
			_animationArr = [];
			for (var i:int = 0; i < 300; i++) 
			{
				var sp:Sprite = new Sprite();
				sp.mouseChildren = false;
				sp.mouseEnabled = false;
				sp.x = Math.random() * this.stage.stageWidth;
				sp.y = Math.random() * this.stage.stageHeight;
				this.addChild(sp);
				var ani:SWFExtraPicMC = new SWFExtraPicMC("boy_dw000");
				sp.addChild(ani);
				ani.play("walk",Math.random() * 8);
				this._animationArr.push(ani);
			}
			
			this.addEventListener(Event.ENTER_FRAME,onFrame);
		}
		
		private var _interval:int = 0;
		protected function onFrame(event:Event):void
		{
			/*this._interval++;
			if(this._interval >= 2)
			{
				this._interval = 0;
				var ani:Animation;
				for each (ani in this._animationArr) 
				{
					ani.update();
				}
			}*/
			
			var ani:Animation;
			for each (ani in this._animationArr) 
			{
				ani.update();
			}
			
			
		}
	}
}