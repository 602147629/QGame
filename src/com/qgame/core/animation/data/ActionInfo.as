package com.qgame.core.animation.data
{
	import flash.geom.Point;

	public class ActionInfo
	{
		public var actionName:String;
		public var dir:int;
		public var startFrame:int;
		public var endFrame:int;
		public var isTurn:Boolean;
		public var delay:int;
		public var isLoop:Boolean;
		public var offsetPoint:Vector.<Point>;
		
		/**
		 * 
		 * @param ActionName
		 * @param Dir
		 * @param StartFrame
		 * @param EndFrame
		 * @param IsTurn
		 * @param Delay
		 * @param IsLoop
		 * 
		 */		
		public function ActionInfo(ActionName:String="",Dir:int=0,StartFrame:int=1,EndFrame:int=1,IsTurn:Boolean=false,Delay:int=0,IsLoop:Boolean=true)
		{
			this.actionName = ActionName;
			this.dir = Dir;
			this.startFrame = StartFrame;
			this.endFrame = EndFrame;
			this.isTurn = IsTurn;
			this.delay = Delay;
			this.isLoop = IsLoop;
		}
		
		public function getOffsetFrom(frame:int):Point
		{
			var index:int = frame - this.startFrame;
			return offsetPoint[index];
		}
	}
}