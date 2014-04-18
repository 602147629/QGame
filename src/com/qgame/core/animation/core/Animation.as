package com.qgame.core.animation.core
{
	import com.qgame.core.animation.data.ActionInfo;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.utils.Dictionary;
	import com.qgame.core.animation.AnimationManager;

	public class Animation extends Bitmap implements IAnimation
	{
		private var _style:String;
		
		protected var _currentActionInfo:ActionInfo;
		
		private var _isPlay:Boolean;
		
		private var _timeCount:int;
		
		private var _currentFrame:int;
		
		private var _offsetPoint:Point;
		
		public function Animation(Style:String = "")
		{
			this.style = Style;
		}
		
		public function set style(value:String):void
		{
			this._style = value;
		}
		
		public function get style():String
		{
			return this._style;
		}
		
		public function play(actionName:String,dir:int = -1):void
		{
			this._currentActionInfo = AnimationManager.instance.getAction(style,actionName,dir);
			if(this._currentActionInfo != null)
			{
				this._currentFrame = this._currentActionInfo.startFrame;
				this._timeCount = this._currentActionInfo.delay;
				this._isPlay = true;
			}
		}
		
		public function stop():void
		{
			this._isPlay = false;
		}
		
		public function update():void
		{
			if(!this._isPlay) return;
			
			this._timeCount--;
			if(this._timeCount > 0)
			{
				return;
			}
			else
			{
				this._timeCount = this._currentActionInfo.delay;
				//如果当前帧大于结束帧
				if(this._currentFrame > this._currentActionInfo.endFrame)
				{
					//如果循环播放
					if(this._currentActionInfo.isLoop)
					{
						this.play(this._currentActionInfo.actionName,this._currentActionInfo.dir);
					}
					else
					{
						//todo 这里处理结束播放
						this.stop();
					}
				}
				var bd:BitmapData = getBitmapdataFrom(style,this._currentActionInfo.actionName,this._currentActionInfo.dir,this._currentFrame);
				if(bd != null && this.bitmapData != bd)
				{
					this.bitmapData = bd;
				}
				this._offsetPoint = getOffsetPoint(this._currentFrame);
				if(this._offsetPoint == null)
				{
					this._offsetPoint = new Point();
				}
				if(this._currentActionInfo.isTurn)
				{
					this.scaleX = -1;
					this.setXY(-this._offsetPoint.x,this._offsetPoint.y);
				}
				else
				{
					this.scaleX = 1;
					this.setXY(this._offsetPoint.x,this._offsetPoint.y);
				}
				this._currentFrame++;
			}
		}
		
		private function setXY(xpos:int=0, ypos:int=0):void
		{
			this.x = xpos;
			this.y = ypos;
		}
		
		protected function getOffsetPoint(frame:int):Point
		{
			throw new Error("由子类实现此方法，以获得bitmapdata数据");
			return null;
		}
		
		protected function getBitmapdataFrom(style:String, actionName:String, dir:int,frame:int):BitmapData
		{
			throw new Error("由子类实现此方法，以获得bitmapdata数据");
			return null;
		}
		
		public function dispose():void
		{
			this._isPlay = false;
			this._currentActionInfo = null;
			this._offsetPoint = null;
			this._currentFrame = 0;
			this.bitmapData.dispose();
			this.bitmapData = null;
		}
	}
}