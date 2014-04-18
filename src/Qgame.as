package
{
	import flash.display.Sprite;
	
	import testApp.MovieClipAPP;
	import testApp.SpriteSheetApp;
	
	/**
	 * arpg游戏 
	 * @author wang
	 * 
	 */
	[SWF(width="1000",height="600",frameRate="30",backgroundColor="0")]
	public class Qgame extends Sprite
	{
		private var _animationArr:Array;
		public function Qgame()
		{
			//图片导出类swf动画
			/*var mc:MovieClipAPP = new MovieClipAPP();
			this.addChild(mc);*/
			
			//spriteSheet动画
			var sp:SpriteSheetApp = new SpriteSheetApp();
			this.addChild(sp);
			
			SWFProfiler.init(this.stage,this);
		}
	}
}