package com.qgame.core.animation
{
	import com.qgame.core.animation.core.Animation;
	
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * 根据SWF里面的导出类图片获得数据的动画 
	 * @author wang
	 * 
	 */
	public class SWFExtraPicMC extends Animation
	{
		public function SWFExtraPicMC(Style:String="")
		{
			super(Style);
		}
		
		override protected function getOffsetPoint(frame:int):Point
		{
			var p:Point = this._currentActionInfo.getOffsetFrom(frame);
			return p;
		}
		
		override protected function getBitmapdataFrom(style:String, actionName:String, dir:int, frame:int):BitmapData
		{
			var bd:BitmapData = AnimationManager.instance.getSWFAnimationBD(style,actionName,dir,frame);
			return bd;
		}
	}
}