package com.qgame.core.animation
{
	import com.qgame.core.animation.core.Animation;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * 根据spriteSheet获得数据的动画 
	 * @author wang
	 * 
	 */
	public class SpriteSheetMC extends Animation
	{
		public function SpriteSheetMC(Style:String="")
		{
			super(Style);
		}
		
		override protected function getOffsetPoint(frame:int):Point
		{
			var p:Point = new Point();
			return p;
		}
		
		override protected function getBitmapdataFrom(style:String, actionName:String, dir:int, frame:int):BitmapData
		{
			var bd:BitmapData = AnimationManager.instance.getSpriteSheetBD(style,actionName,dir,frame);
			return bd;
		}
	}
}